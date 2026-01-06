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

// Usuni?to bibliotek? email_client.h zgodnie z pro?b?

#define FCY 16000000UL
#include <libpic30.h>

// --- KONFIGURACJA UI POGODY ---
// Nag?ówek na górze (to on b?dzie zmienia? kolor)
#define HEADER_X      0
#define HEADER_Y      0
#define HEADER_W      240
#define HEADER_H      30

// Suwak kolorów na samym dole ekranu
#define SLIDER_X      10
#define SLIDER_Y      202
#define SLIDER_W      180
#define SLIDER_H      36

// --- STANY APLIKACJI ---
typedef enum {
    STATE_WIFI_SELECT,
    STATE_CONNECTING,
    STATE_LOGIN,
    STATE_CITY_SELECT,
    STATE_WEATHER
} AppState;

AppState currentState = STATE_WIFI_SELECT;

// --- FUNKCJA RYSUJ?CA INTERFEJS POGODY ---
void Draw_Weather_Interface(uint16_t headerColor) {
    TFT_FillScreen(TFT_BLACK);
    
    // 1. Rysujemy nag?ówek w wybranym kolorze
    TFT_FillRect(HEADER_X, HEADER_Y, HEADER_W, HEADER_H, headerColor);
    TFT_Print(10, 8, "POGODA LIVE", TFT_BLACK, headerColor, 2);
    
    // 2. Rysujemy przycisk powrotu
    Draw_Return_Button(); 
    
    // 3. Rysujemy suwak kolorów na dole
    TFT_Draw_Rainbow_Bar(SLIDER_X, SLIDER_Y, SLIDER_W, SLIDER_H);
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
    
    // Zmienne dla ekranu pogody
    uint16_t userColor = TFT_CYAN;  // Domy?lny kolor nag?ówka
    bool weatherScreenInit = false; // Flaga, ?eby narysowa? interfejs tylko raz
    
    // Zmienna do usuwania starego paska na suwaku (-1 oznacza brak paska)
    int last_slider_x = -1; 

    while (1) {
        wifi_task();
        
        switch (currentState) {
            
            // --- 1. WYBÓR SIECI ---
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


            // --- 2. OCZEKIWANIE ---
            case STATE_CONNECTING:
                // A. Sukces
                if (wifi_connected) {
                    TFT_FillScreen(TFT_BLACK);
                    Draw_Keypad();
                    Update_Pin_Display();
                    currentState = STATE_LOGIN;
                    break; 
                }
                
                // B. B??d modu?u
                if (wifi_connect_error) {
                    TFT_Print(20, 260, "BLAD! Sprobuj ponownie.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }

                // C. Timeout
                timeoutCounter++;
                if (timeoutCounter > 1000) { 
                    TFT_Print(20, 260, "TIMEOUT! Brak sieci.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }
                
                // D. Anulowanie
                if (Touch_IsPressed()) {
                    TFT_Print(20, 260, "Anulowano.", TFT_YELLOW, TFT_BLACK, 1);
                    m2m_wifi_disconnect(); 
                    __delay_ms(1000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                }
                break;


            // --- 3. LOGIN ---
            case STATE_LOGIN:
                if (!Touch_IsPressed()) break;  
                if (!Touch_GetCoordinates(&x, &y)) break;

                if (Handle_Login_Touch(x, y)) {
                    Draw_City_Menu(); 
                    currentState = STATE_CITY_SELECT;
                    __delay_ms(500);
                }
                break;

            // --- 4. WYBÓR MIASTA ---
            case STATE_CITY_SELECT:
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                int cityIndex = Check_City_Touch(x, y);
                if (cityIndex != -1) {
                    weather_set_city(polish_cities[cityIndex]);
                    
                    weather_client_reset(); 
                    
                    // Przechodzimy do pogody - resetujemy flagi
                    weatherScreenInit = false; 
                    last_slider_x = -1; // Reset pozycji suwaka
                    
                    currentState = STATE_WEATHER;
                    __delay_ms(500);
                }
                break;

            // --- 5. POGODA + SUWAK KOLORU ---
            case STATE_WEATHER:
                // A. Rysowanie interfejsu (tylko raz po wej?ciu)
                if (!weatherScreenInit) {
                    Draw_Weather_Interface(userColor);
                    weatherScreenInit = true;
                }
            
                // B. Aktualizacja danych tekstowych w tle
                if (!Touch_IsPressed()) {
                    weather_client_task();
                    break; 
                }

                // C. Obs?uga dotyku
                if (!Touch_GetCoordinates(&x, &y)) break;

                // 1. SPRAWDZENIE SUWAKA (Zmiana koloru)
                if (x >= SLIDER_X && x <= (SLIDER_X + SLIDER_W) &&
                    y >= SLIDER_Y && y <= (SLIDER_Y + SLIDER_H)) 
                {                 
                    if (last_slider_x != -1) {
                        // Obliczamy kolor, jaki by? w tym miejscu oryginalnie
                        uint16_t old_rel_x = last_slider_x - SLIDER_X;
                        uint8_t old_hue = (old_rel_x * 255) / SLIDER_W;
                        uint16_t old_bg_color = Color_Wheel(old_hue);
                        
                        // Zamalowujemy stary bia?y pasek oryginalnym kolorem t?czy
                        TFT_FillRect(last_slider_x, SLIDER_Y, 2, SLIDER_H, old_bg_color);
                    }

                    // Krok 2: Obliczenie nowego koloru
                    uint16_t rel_x = x - SLIDER_X;
                    uint8_t hue = (rel_x * 255) / SLIDER_W;
                    userColor = Color_Wheel(hue);
                    
                    // Krok 3: Rysowanie nowego bia?ego paska (wska?nika)
                    TFT_FillRect(x, SLIDER_Y, 2, SLIDER_H, TFT_WHITE);
                    last_slider_x = x; // Zapami?tujemy pozycj?

                    // Krok 4: Aktualizacja nag?ówka
                    TFT_FillRect(HEADER_X, HEADER_Y, HEADER_W, HEADER_H, userColor);
                    TFT_Print(10, 8, "POGODA LIVE", TFT_BLACK, userColor, 2);
                }
                
                // 2. PRZYCISK "POWRÓT" (EXIT)
                // Sprawdzamy, czy Y > 200, ale te? czy nie jeste?my na suwaku
                else if (x > 200 && y > 200 && y < SLIDER_Y) { 
                    weather_client_reset(); 

                    Draw_City_Menu();
                    currentState = STATE_CITY_SELECT;
                    __delay_ms(500);
                }
                
                break;
        }
        
        __delay_ms(10);
    }
    return 1;
}