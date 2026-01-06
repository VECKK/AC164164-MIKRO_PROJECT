#include <stdio.h>
#include <string.h>
#include "../system.h"
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/examples/wifi_connection.h"
#include "mcc_generated_files/examples/weather_client.h"
#include "ILI9341_files/tft_gfx.h"
#include "ILI9341_files/touch_sensor.h"
#include "ILI9341_files/keypad.h"
#include "mcc_generated_files/examples/city_menu.h"
#include "mcc_generated_files/examples/email_client.h"

#define FCY 16000000UL
#define FCY 16000000UL
#include <libpic30.h>

// --- STRUKTURA U?YTKOWNIKA ---
typedef struct {
    char pin[5];            
    uint16_t headerColor;   
    char* startCity;        
    char name[10];          
} UserProfile;

// --- DANE U?YTKOWNIK�W ---
UserProfile users[3] = {
    {"1234", TFT_CYAN,  "Warszawa", "Lukasz"},
    {"1111", TFT_RED,   "Krakow",   "Kacper"},
    {"2222", TFT_GREEN, "Wroclaw",  "Wiktoria"}
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

bool static is_sending_email;

bool static is_sending_email;

// --- FUNKCJA LOGIKI WYLOGOWANIA ---
void Perform_Logout_Logic(void) {
    // Animacja graficzna (z city_menu.c)
    Animate_Logout_Click();
    __delay_ms(200);

    currentUserIndex = -1;
    
    // Zmiana ekranu
    TFT_FillScreen(TFT_BLACK);
    Draw_Keypad();
    Update_Pin_Display();
    
    currentState = STATE_LOGIN;
}

// --- MAIN ---
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    
    wifi_setup();
    weather_client_init();

    Draw_Wifi_Menu();
    
    uint16_t x, y;
    int selectedNetworkIndex = -1;
    int timeoutCounter = 0; 
    
    bool weatherScreenInit = false; 
    int last_slider_x = -1; 

    while (1) {
        wifi_task();
        email_client_task();
        
        switch (currentState) {
            
            // --- 1. WYB�R SIECI ---
            case STATE_WIFI_SELECT:
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                selectedNetworkIndex = Check_Wifi_Touch(y);
                if (selectedNetworkIndex == -1) break;
                
                Wifi_Highlight_Button(selectedNetworkIndex, TFT_RED); 
                Wifi_Connect_Selection(selectedNetworkIndex);         
                timeoutCounter = 0;                                   
                currentState = STATE_CONNECTING;
                __delay_ms(500); 
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
                if (timeoutCounter > 1000) { 
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


            // --- 3. LOGOWANIE PINEM ---
            case STATE_LOGIN:
                if (!Touch_IsPressed()) break;  
                if (!Touch_GetCoordinates(&x, &y)) break;

                int loggedID = Handle_Login_Touch(users[0].pin, users[1].pin, users[2].pin, x, y);
                
                if (loggedID != -1) {
                    currentUserIndex = loggedID;
                    weather_set_city(users[currentUserIndex].startCity);
                    weather_client_reset();
                    
                    weatherScreenInit = false; 
                    last_slider_x = -1;
                    
                    currentState = STATE_WEATHER;
                    __delay_ms(500);
                }
                break;

            // --- 4. CITY ---
            case STATE_CITY_SELECT:
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                // A.
                int cityIndex = Check_City_Touch(x, y);
                if (cityIndex != -1) {
                    weather_set_city(polish_cities[cityIndex]);
                    weather_client_reset(); 
                    
                    weatherScreenInit = false; 
                    last_slider_x = -1;
                    currentState = STATE_WEATHER;
                    __delay_ms(500);
                }
                // B. LOGOUT (Prawy G�rny R�g)
                else if (Check_Logout_Touch(x, y)) {
                    Perform_Logout_Logic();
                    __delay_ms(500);
                }
                break;

            // --- 5. POGODA (G?�wny ekran) ---
            case STATE_WEATHER:
                if (is_sending_email) {
                    break; 
                }
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                // 1. ZMIANA KOLORU (Suwak - definicje z city_menu.h)
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
                
                // 2. PRZYCISK LOGOUT (Prawy G�rny R�g)
                else if (Check_Logout_Touch(x, y)) {
                     weather_client_reset(); // Stop pobierania danych
                     Perform_Logout_Logic();
                     break; // Wyj?cie, aby nie rysowa? dalej
                }

                // 3. PRZYCISK RETURN (Prawy Dolny R�g)
                else if (x > 200 && y > 200) { 
                    TFT_DrawRect(BUTTON_X, RETURN_Y, BUTTON_W, BUTTON_H, TFT_WHITE);
                    weather_client_reset(); 
                    Draw_City_Menu(); 
                    currentState = STATE_CITY_SELECT;
                    __delay_ms(500);
                } else if (Check_Send_Touch(x, y)) {
                    // Animacja klikni?cia (rysowanie bia?ego prostok?ta)
                    TFT_FillRect(200, 150, 110, 39, TFT_WHITE);
                    TFT_Print(210, 160, "Sending", TFT_BLACK, TFT_WHITE, 2);
                    __delay_ms(100);

                    // 1. Pobierz e-mail u?ytkownika
                    char* target = get_user_email();

                    // 2. Sprawd? czy e-mail zosta? ustawiony (czy by?o logowanie)
                    if (strlen(target) > 0) {
                        // Pobierz dane pogodowe
                        char weather_data[128];
                        weather_get_last_data(weather_data);

                        // Rozpocznij wysy?anie
                        email_send_start(target, "Raport Pogodowy", weather_data);
                        is_sending_email = true;
                    } else {
                        // B??d - brak e-maila (u?ytkownik pomin?? logowanie?)
                        TFT_Print(10, 260, "Blad: Brak Email!", TFT_RED, TFT_BLACK, 1);
                        Draw_Send_Button();
                    }

                    while(Touch_IsPressed());
                }
                    break; // Wyj?cie
                }
                
                // Aktualizacja w tle (tylko gdy nie ma akcji wyj?cia)
                weather_client_task();
                
                break;
        }
        
        __delay_ms(10);
    }
    return 1;
}