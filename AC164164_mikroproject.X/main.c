#include <stdio.h>
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
#include <libpic30.h>

// --- STANY APLIKACJI ---
typedef enum {
    STATE_WIFI_SELECT,
    STATE_CONNECTING,
    STATE_LOGIN,
    STATE_CITY_SELECT,
    STATE_WEATHER
} AppState;

AppState currentState = STATE_WIFI_SELECT;

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

    while (1) {
        wifi_task();
        email_client_task();
        
        switch (currentState) {
            
            // --- 1. WYBÓR SIECI ---
            case STATE_WIFI_SELECT:
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                selectedNetworkIndex = Check_Wifi_Touch(y);
                if (selectedNetworkIndex == -1) break;
                
                Wifi_Highlight_Button(selectedNetworkIndex, TFT_RED); // 1. Pod?wietl ramk? na CZERWONO
                Wifi_Connect_Selection(selectedNetworkIndex);         // 2. Rozpocznij ??czenie
                timeoutCounter = 0;                                   // 3. Reset licznika i zmiana stanu
                currentState = STATE_CONNECTING;
                
                __delay_ms(500); // Debounce
                break;


            // --- 2. OCZEKIWANIE (Z OBS?UG? B??DÓW) ---
            case STATE_CONNECTING:
                // A. Sukces
                if (wifi_connected) {
                    TFT_FillScreen(TFT_BLACK);
                    Draw_Keypad();
                    Update_Pin_Display();
                    currentState = STATE_LOGIN;
                    break; // Wyj?cie ze switcha
                }
                
                // B. B??d modu?u
                if (wifi_connect_error) {
                    TFT_Print(20, 260, "BLAD! Sprobuj ponownie.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }

                // C. Obs?uga Timeoutu
                timeoutCounter++;
                if (timeoutCounter > 1000) { 
                    TFT_Print(20, 260, "TIMEOUT! Brak sieci.", TFT_RED, TFT_BLACK, 1);
                    __delay_ms(2000);
                    Draw_Wifi_Menu();
                    currentState = STATE_WIFI_SELECT;
                    break;
                }
                
                // D. Anulowanie przez u?ytkownika
                if (Touch_IsPressed()) {
                    TFT_Print(20, 260, "Anulowano.", TFT_YELLOW, TFT_BLACK, 1);
                    m2m_wifi_disconnect(); // Przerwij prac? modu?u
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

            // --- 4. CITY ---
            case STATE_CITY_SELECT:
                if (!Touch_IsPressed()) break;
                if (!Touch_GetCoordinates(&x, &y)) break;

                int cityIndex = Check_City_Touch(x, y);
                if (cityIndex != -1) {
                    weather_set_city(polish_cities[cityIndex]);
                    
                    weather_client_reset(); 
                    
                    TFT_FillScreen(TFT_BLACK);
                    Draw_Return_Button(); // Narysuj przycisk powrotu na dole
                    Draw_Send_Button();
                    
                    currentState = STATE_WEATHER;
                    __delay_ms(500);
                }
                break;

            // --- 5. POGODA ---
            case STATE_WEATHER:
                // Obs?uga przycisku RETURN
                if (!Touch_IsPressed()){
                    weather_client_task();
                    break;
                }
                if (!Touch_GetCoordinates(&x, &y)) break; 
                if (y > 200 && x > 200) { 
                    weather_client_reset(); 

                    // Wracamy do menu
                    Draw_City_Menu();
                    currentState = STATE_CITY_SELECT;
                    __delay_ms(500);
                } else if (Check_Send_Touch(x, y)) {
                    // Animacja klikni?cia (rysowanie bia?ego prostok?ta)
                    TFT_FillRect(200, 150, 110, 39, TFT_WHITE);
                    __delay_ms(100);
                    Draw_Send_Button(); // Przywró? zielony kolor

                    // 1. Pobierz e-mail u?ytkownika
                    char* target = get_user_email();

                    // 2. Sprawd? czy e-mail zosta? ustawiony (czy by?o logowanie)
                    if (strlen(target) > 0) {
                        // Pobierz dane pogodowe
                        char weather_data[128];
                        weather_get_last_data(weather_data);

                        // Rozpocznij wysy?anie
                        email_send_start(target, "Raport Pogodowy", weather_data);
                    } else {
                        // B??d - brak e-maila (u?ytkownik pomin?? logowanie?)
                        TFT_Print(10, 260, "Blad: Brak Email!", TFT_RED, TFT_BLACK, 1);
                    }

                    __delay_ms(1000); // Debounce - zapobiega wielokrotnemu wys?aniu
                }
                break;
        }
        
        __delay_ms(10);
    }
    return 1;
}