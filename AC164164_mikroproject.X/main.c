#include <stdio.h>
#include <string.h>
#include "../system.h"
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/examples/wifi_connection.h"
#include "mcc_generated_files/examples/weather_client.h"
#include "mcc_generated_files/examples/email_client.h" 
#include "ILI9341_files/tft_gfx.h"
#include "ILI9341_files/touch_sensor.h"
#include "ILI9341_files/keypad.h"
#include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/i2c1_driver.h"
#include "RFID/pn532.h"
#include "mcc_generated_files/examples/city_menu.h"
#include "mcc_generated_files/examples/user_manager.h" 

#define FCY 16000000UL
#define PN532_I2C_ADDR (0x48 >> 1)
#include <libpic30.h>

AppState currentState = STATE_WIFI_SELECT;

// --- MAIN ---
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    
    i2c1_driver_driver_open();
    if (PN532_Init()) {
        LED_GREEN_SetHigh(); 
        __delay_ms(200);
        LED_GREEN_SetLow();
    } 
    
    PN532_Tag currentTag;
    
    wifi_setup();
    weather_client_init();
    
    Draw_Wifi_Menu();
    
    uint16_t x, y;
    int selectedNetworkIndex = -1;
    int timeoutCounter = 0; 
    
    bool weatherScreenInit = false; 
    int last_slider_x = -1; 
    
    int rfid_scan_counter = 0;

    while (1) {
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

            // --- 3. LOGOWANIE PINEM I RFID ---
            case STATE_LOGIN:
                // A. Obsluga Dotyku
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        int loggedID = Handle_Login_Touch(users[0].pin, users[1].pin, users[2].pin, x, y);
                        if (loggedID != -1) {
                            currentUserIndex = loggedID;
                            rfid_scan_counter = 0; 
                        }
                    }
                }

                // B. Obsluga RFID
                if (currentUserIndex == -1) { 
                    rfid_scan_counter++;
                    if (rfid_scan_counter >= 50) { 
                        
                        if (PN532_ReadPassiveTargetID(&currentTag)) {
                            int detectedUser = FindUserByCard(&currentTag);
                            
                            if (detectedUser != -1) {
                                currentUserIndex = detectedUser;
                            } else {
                                // Komunikat bledu + aktywne oczekiwanie
                                TFT_FillRect(18, 210, 205, 20, TFT_YELLOW); 
                                TFT_Print(22, 214, "Brak uzytkownika", TFT_RED, TFT_YELLOW, 2);
                                
                                for(int k=0; k<100; k++) {
                                    wifi_task();         
                                    email_client_task(); 
                                    __delay_ms(10);
                                }
                                
                                TFT_FillRect(18, 210, 205, 20, TFT_BLACK);
                            }
                        }
                        rfid_scan_counter = 0; 
                    }
                }

                // C. Logowanie udane - Powitanie
                if (currentUserIndex != -1) {
                    TFT_FillScreen(TFT_BLACK);
                    
                    char welcomeBuf[40];
                    sprintf(welcomeBuf, "Witaj %s!", users[currentUserIndex].name);
                    TFT_Print(20, 140, welcomeBuf, TFT_GREEN, TFT_BLACK, 3);
                    
                    for(int i=0; i<150; i++) {
                        wifi_task();
                        email_client_task();
                        __delay_ms(10);
                    }

                    weather_set_city(users[currentUserIndex].startCity);
                    weather_client_reset();
                    
                    weatherScreenInit = false; 
                    last_slider_x = -1;
                    
                    TFT_FillScreen(TFT_BLACK); 
                    currentState = STATE_WEATHER;
                }
                break;

            // --- 4. WYBOR MIASTA ---
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
                            Perform_Logout_Logic(&currentState);
                            __delay_ms(500);
                        }
                    }
                }
                break;

            // --- 5. POGODA ---
            case STATE_WEATHER:
                if (!weatherScreenInit) {
                    Draw_Weather_Interface(users[currentUserIndex].headerColor, users[currentUserIndex].name);
                    weatherScreenInit = true;
                }
            
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
                        
                        // WYSYLANIE EMAILA
                        else if (Check_Email_Touch(x, y)) {
                            Animate_Email_Click();
                            
                            weather_client_reset();
                            for(int k=0; k<100; k++) { wifi_task(); __delay_ms(10); }

                            TFT_Print(10, 260, "Wysylanie...", TFT_YELLOW, TFT_BLACK, 1);
                            
                            char weather_data[128] = "Brak danych";
                            weather_get_last_data(weather_data); 
                            
                            char* targetEmail = users[currentUserIndex].email;
                            
                            if (strlen(targetEmail) > 0) {
                                email_send_start(targetEmail, "Raport Pogodowy", weather_data);
                                
                                for(int i=0; i<600; i++) { 
                                    wifi_task();         
                                    email_client_task(); 
                                    __delay_ms(10);
                                }
                                TFT_Print(10, 260, "Wyslano!      ", TFT_GREEN, TFT_BLACK, 1);
                            } else {
                                TFT_Print(10, 260, "Brak emaila!", TFT_RED, TFT_BLACK, 1);
                            }
                            
                            __delay_ms(1000); 
                            Draw_Email_Button(); 
                            TFT_FillRect(10, 260, 200, 20, TFT_BLACK); 
                        }

                        // Logout
                        else if (Check_Logout_Touch(x, y)) {
                             Perform_Logout_Logic(&currentState);
                        }
                        // Return
                        else if (x >= BUTTON_X && y >= RETURN_Y) { 
                            weather_client_reset(); 
                            Draw_City_Menu(); 
                            currentState = STATE_CITY_SELECT;
                            break;
                        }
                    }
                }
                
                weather_client_task();
                break;
        }
        
        __delay_ms(10); 
    }
    return 1;
}