#include <stdio.h>
#include <string.h>
#include "../system.h"
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/examples/wifi_connection.h"
#include "mcc_generated_files/examples/weather_client.h"
// Odkomentuj, je?li masz ten plik w projekcie
#include "mcc_generated_files/examples/email_client.h" 
#include "ILI9341_files/tft_gfx.h"
#include "ILI9341_files/touch_sensor.h"
#include "ILI9341_files/keypad.h"
#include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/i2c1_driver.h"
#include "RFID/pn532.h"
#include "mcc_generated_files/examples/city_menu.h"

#define FCY 16000000UL
#define PN532_I2C_ADDR (0x48 >> 1)

#include <libpic30.h>

// --- KONFIGURACJA EMAIL ---
#define DEFAULT_EMAIL "u3359765482@gmail.com" 

// --- STRUKTURA U?YTKOWNIKA ---
typedef struct {
    char pin[5];            
    uint16_t headerColor;   
    char* startCity;        
    char name[10];
    char* email;
    uint8_t rfid_uid[4]; 
} UserProfile;

// --- DANE U?YTKOWNIKÓW ---
UserProfile users[3] = {
    {"1111", TFT_CYAN,  "Warszawa", "Lukasz",   DEFAULT_EMAIL, {0xAA, 0xFC, 0x98, 0x04}},  
    {"2222", TFT_RED,   "Krakow",   "Kacper",   DEFAULT_EMAIL, {0xBC, 0x4A, 0x7E, 0x05}}, 
    {"3333", TFT_GREEN, "Wroclaw",  "Wiktoria", DEFAULT_EMAIL, {0x5B, 0x7C, 0x57, 0x1F}} 
};

int currentUserIndex = -1;

// --- STANY APLIKACJI ---
typedef enum {
    STATE_WIFI_SELECT,
    STATE_CONNECTING,
    STATE_LOGIN,
    STATE_CITY_SELECT,
    STATE_WEATHER
} AppState;

AppState currentState = STATE_WIFI_SELECT;

// --- FUNKCJE POMOCNICZE ---

int FindUserByCard(PN532_Tag* tag) {
    if (tag->uidLen != 4) return -1; 
    for (int i = 0; i < 3; i++) {
        if (memcmp(tag->uid, users[i].rfid_uid, 4) == 0) {
            return i; 
        }
    }
    return -1; 
}

void Perform_Logout_Logic(void) {
    Animate_Logout_Click();
    __delay_ms(100); // Krótszy czas

    currentUserIndex = -1;
    
    // Zatrzymujemy klienta pogody
    weather_client_reset(); 
    
    // --- FIX: Resetujemy czytnik RFID, ?eby "wsta?" na nowo ---
    PN532_Init(); 
    
    TFT_FillScreen(TFT_BLACK);
    Draw_Keypad();
    Update_Pin_Display();
    
    currentState = STATE_LOGIN;
}

// --- DEBUG MODE (Zakomentowany) ---
/*
void Run_RFID_Debug_Loop(void) {
    PN532_Tag debugTag;
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(10, 10, "TRYB DEBUG RFID", TFT_WHITE, TFT_BLACK, 2);
    while(1) {
        if (PN532_ReadPassiveTargetID(&debugTag)) {
            TFT_FillScreen(TFT_BLUE);
            char uidBuf[50];
            sprintf(uidBuf, "%02X %02X %02X %02X", 
                    debugTag.uid[0], debugTag.uid[1], 
                    debugTag.uid[2], debugTag.uid[3]);
            TFT_Print(10, 90, uidBuf, TFT_YELLOW, TFT_BLUE, 3);
            __delay_ms(2000); 
            TFT_FillScreen(TFT_BLACK);
        }
        __delay_ms(100);
    }
}
*/

// --- MAIN ---
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    
    // Inicjalizacja I2C i RFID
    i2c1_driver_driver_open();
    if (PN532_Init()) {
        LED_GREEN_SetHigh(); 
        __delay_ms(200);
        LED_GREEN_SetLow();
    } 
    
    // Run_RFID_Debug_Loop(); // ODKOMENTUJ TYLKO DO ODCZYTU NOWYCH KART
    
    PN532_Tag currentTag;
    
    wifi_setup();
    weather_client_init();
    
    Draw_Wifi_Menu();
    
    uint16_t x, y;
    int selectedNetworkIndex = -1;
    int timeoutCounter = 0; 
    
    bool weatherScreenInit = false; 
    int last_slider_x = -1; 
    
    // Zmienne do interwa?u RFID (Fix dla blokowania dotyku)
    int rfid_scan_counter = 0;
    const int RFID_SCAN_INTERVAL = 30; // Co ile p?tli skanowa? (30 * 10ms = 300ms)

    while (1) {
        // 1. Zadania globalne (zawsze dzia?aj?)
        wifi_task();
        email_client_task(); 
        
        switch (currentState) {
            
            // --- 1. WYBÓR SIECI ---
            case STATE_WIFI_SELECT:
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        selectedNetworkIndex = Check_Wifi_Touch(y);
                        if (selectedNetworkIndex != -1) {
                            Wifi_Highlight_Button(selectedNetworkIndex, TFT_RED); 
                            Wifi_Connect_Selection(selectedNetworkIndex);         
                            timeoutCounter = 0;                                   
                            currentState = STATE_CONNECTING;
                            __delay_ms(500); 
                        }
                    }
                }
                break;

            // --- 2. OCZEKIWANIE NA WIFI ---
            case STATE_CONNECTING:
                if (wifi_connected) {
                    TFT_FillScreen(TFT_BLACK);
                    Draw_Keypad();
                    Update_Pin_Display();
                    currentState = STATE_LOGIN;
                    break; 
                }
                
                if (wifi_connect_error) {
                    TFT_Print(20, 260, "BLAD! Sprobuj ponownie.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }

                timeoutCounter++;
                if (timeoutCounter > 10000) { 
                    TFT_Print(20, 260, "TIMEOUT! Brak sieci.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }
                
                if (Touch_IsPressed()) {
                    TFT_Print(20, 260, "Anulowano.", TFT_YELLOW, TFT_BLACK, 1);
                    m2m_wifi_disconnect(); 
                    __delay_ms(1000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                }
                break;

            case STATE_LOGIN:
                // A. Obs?uga Dotyku (SZYBKA - w ka?dej p?tli)
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        int loggedID = Handle_Login_Touch(users[0].pin, users[1].pin, users[2].pin, x, y);
                        if (loggedID != -1) {
                            currentUserIndex = loggedID;
                            rfid_scan_counter = 0; // Reset licznika
                        }
                    }
                }

                // B. Obs?uga RFID (WOLNA - raz na ~500ms)
                // Zwi?ksz interwa? do 50, ?eby rzadziej blokowa? procesor
                // 50 * 10ms = 500ms (pó? sekundy)
                if (currentUserIndex == -1) { 
                    rfid_scan_counter++;
                    if (rfid_scan_counter >= 50) { 
                        
                        // Tutaj nast?pi próba odczytu (mo?e zaj?? do 100-200ms w pn532.c)
                        if (PN532_ReadPassiveTargetID(&currentTag)) {
                            int detectedUser = FindUserByCard(&currentTag);
                            
                            if (detectedUser != -1) {
                                currentUserIndex = detectedUser;
                                TFT_Print(20, 280, "Karta OK!", TFT_GREEN, TFT_BLACK, 2);
                            } else {
                                // Opcjonalnie: mrugnij, ?e karta nieznana, ale nie blokuj
                                // TFT_Print(20, 280, "Nieznana!", TFT_RED, TFT_BLACK, 2);
                            }
                        }
                        rfid_scan_counter = 0; 
                    }
                }

                // C. Przej?cie dalej
                if (currentUserIndex != -1) {
                    weather_set_city(users[currentUserIndex].startCity);
                    weather_client_reset();
                    
                    weatherScreenInit = false; 
                    last_slider_x = -1;
                    
                    // Wa?ne: Wyczy?? ekran RAZ przed zmian? stanu,
                    // ?eby pozby? si? "duchów" klawiatury/b??dów
                    TFT_FillScreen(TFT_BLACK); 
                    
                    currentState = STATE_WEATHER;
                    // Bez delaya tutaj, ?eby od razu rysowa?
                }
                break;

            // --- 4. WYBÓR MIASTA ---
            case STATE_CITY_SELECT:
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        int cityIndex = Check_City_Touch(x, y);
                        if (cityIndex != -1) {
                            weather_set_city(polish_cities[cityIndex]);
                            weather_client_reset(); 
                            
                            weatherScreenInit = false; 
                            last_slider_x = -1;
                            currentState = STATE_WEATHER;
                            __delay_ms(500);
                        }
                        else if (Check_Logout_Touch(x, y)) {
                            Perform_Logout_Logic();
                            __delay_ms(500);
                        }
                    }
                }
                break;

            // --- 5. POGODA ---
            case STATE_WEATHER:
                // !!! POPRAWKA 1: weather_client_task TYLKO w tym stanie !!!
                weather_client_task(); 
            
                if (!weatherScreenInit) {
                    Draw_Weather_Interface(users[currentUserIndex].headerColor, users[currentUserIndex].name);
                    weatherScreenInit = true;
                }
            
                // Obs?uga dotyku
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        
                        // Zmiana koloru
                        if (x >= SLIDER_X && x <= (SLIDER_X + SLIDER_W) &&
                            y >= SLIDER_Y && y <= (SLIDER_Y + SLIDER_H)) 
                        {
                            if (last_slider_x != -1) {
                                uint16_t old_rel_x = last_slider_x - SLIDER_X;
                                uint8_t old_hue = (old_rel_x * 255) / SLIDER_W;
                                TFT_FillRect(last_slider_x, SLIDER_Y, 2, SLIDER_H, Color_Wheel(old_hue));
                            }
                            uint16_t rel_x = x - SLIDER_X;
                            uint8_t hue = (rel_x * 255) / SLIDER_W;
                            uint16_t newColor = Color_Wheel(hue);
                            users[currentUserIndex].headerColor = newColor;
                            TFT_FillRect(x, SLIDER_Y, 2, SLIDER_H, TFT_WHITE);
                            last_slider_x = x; 
                            TFT_FillRect(HEADER_X, HEADER_Y, HEADER_W, HEADER_H, newColor);
                            char headerText[30];
                            sprintf(headerText, "POGODA - %s", users[currentUserIndex].name);
                            TFT_Print(5, 8, headerText, TFT_BLACK, newColor, 2);
                        }
                        // E-mail
                        else if (Check_Email_Touch(x, y)) {
                            Animate_Email_Click();
                            char weather_data[128] = "Brak danych";
                            weather_get_last_data(weather_data); 
                            char* targetEmail = users[currentUserIndex].email;
                            if (strlen(targetEmail) > 0) {
                                email_send_start(targetEmail, "Raport Pogodowy", weather_data);
                            } else {
                                TFT_Print(10, 260, "Brak emaila!", TFT_RED, TFT_BLACK, 1);
                            }
                            __delay_ms(500);
                            Draw_Email_Button();
                        }
                        // Logout
                        else if (Check_Logout_Touch(x, y)) {
                             Perform_Logout_Logic();
                        }
                        // Return
                        else if (x >= BUTTON_X && y >= RETURN_Y) { 
                            weather_client_reset(); 
                            Draw_City_Menu(); 
                            currentState = STATE_CITY_SELECT;
                        }
                    }
                }
                break;
        }
        
        __delay_ms(10); // Krótkie opó?nienie p?tli
    }
    return 1;
}