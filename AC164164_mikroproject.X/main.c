/**
  Generated main.c file from MPLAB Code Configurator

  @Company
    Microchip Technology Inc.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.171.5
        Device            :  PIC24FJ128GA705
    The generated drivers are tested against the following:
        Compiler          :  XC16 v2.10
        MPLAB 	          :  MPLAB X v6.05
*/

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/

/**
  Section: Included Files
*/
#include    <stdio.h>
#include    "../system.h"
#include    "mcc_generated_files/system.h"
#include    "mcc_generated_files/examples/wifi_connection.h"
#include    "mcc_generated_files/examples/weather_client.h"
#include    "ILI9341_files/tft_gfx.h"
#include    "ILI9341_files/touch_sensor.h"

// FCY dla main.c
#define FCY 16000000UL 
#include <libpic30.h>

/*
                         Main application
 */
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    
    uint16_t touchX = 0, touchY = 0;
    
    char buffer[32]; 
    
    TFT_FillScreen(TFT_BLACK);
    
    TFT_Print(10, 110, "X:", TFT_WHITE, TFT_BLACK, 2);
    TFT_Print(10, 140, "Y:", TFT_WHITE, TFT_BLACK, 2);
    TFT_Print(10, 170, "Status:", TFT_WHITE, TFT_BLACK, 2);
    
    TFT_FillRect(10, 10, 50, 50, TFT_RED);       
    TFT_FillRect(70, 10, 50, 50, TFT_GREEN);     
    TFT_FillRect(130, 10, 50, 50, TFT_BLUE);     

    TFT_Print(10, 80, "Touch Test", TFT_WHITE, TFT_BLACK, 1);
    
    while (1) {
        
        if (Touch_IsPressed())
        {
            if (Touch_GetCoordinates(&touchX, &touchY))
            {
                TFT_FillRect(touchX, touchY, 2, 2, TFT_YELLOW);
            }
            
            TFT_Print(80, 170, "Pressed   ", TFT_GREEN, TFT_BLACK, 2);
        }
        else
        {
            TFT_Print(80, 170, "NotPressed", TFT_RED, TFT_BLACK, 2);
        }
        
        sprintf(buffer, "%d   ", touchX); 
        TFT_Print(50, 110, buffer, TFT_WHITE, TFT_BLACK, 2);

        sprintf(buffer, "%d   ", touchY);
        TFT_Print(50, 140, buffer, TFT_WHITE, TFT_BLACK, 2);
        
        __delay_ms(100);
        
        
    //    printf("\r\nStart test Wi-Fi\r\n");
    //    wifi_connection();
    //    weather_client_init();
    //    weather_client_task();
    }
    return 1;
}
/**
 End of File
*/

