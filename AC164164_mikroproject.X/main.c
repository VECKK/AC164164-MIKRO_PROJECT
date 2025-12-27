#include <stdio.h>
#include "../system.h"
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/examples/wifi_connection.h"
#include "mcc_generated_files/examples/weather_client.h"
#include "ILI9341_files/tft_gfx.h"
#include "ILI9341_files/touch_sensor.h"
#include "ILI9341_files/keypad.h"

#define FCY 16000000UL 
#include <libpic30.h>

typedef enum {
    STATE_LOGIN,    
    STATE_WEATHER   
} AppState;

AppState currentState = STATE_LOGIN;

int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    
    wifi_setup();
    weather_client_init();

    // Inicjalizacja ekranu logowania
    Draw_Keypad();
    Update_Pin_Display();

    uint16_t x, y;

    while (1) {
        // WiFi dzia?a w tle
        wifi_task();
        
        switch (currentState) {
            case STATE_LOGIN:
                if (Touch_IsPressed()) {
                    if (Touch_GetCoordinates(&x, &y)) {
                        // Funkcja zwraca true tylko gdy zalogowano pomy?lnie
                        if (Handle_Login_Touch(x, y)) {
                            currentState = STATE_WEATHER;
                        }
                    }
                }
                break;

            case STATE_WEATHER:
                weather_client_task();
                
                // Tutaj mo?esz doda? obs?ug? wylogowania, np:
                /*
                if (Touch_IsPressed()) {
                   currentState = STATE_LOGIN;
                   Draw_Keypad();
                   Update_Pin_Display();
                }
                */
                break;
        }
        
        __delay_ms(10);
    }
    return 1;
}