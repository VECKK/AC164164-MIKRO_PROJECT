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


void Test_Touch_Init(){
    TFT_Print(150, 130, "X:", TFT_WHITE, TFT_BLACK, 2);;
    TFT_Print(150, 160, "Y:", TFT_WHITE, TFT_BLACK, 2);
    TFT_Print(150, 190, "Status:", TFT_WHITE, TFT_BLACK, 1);      

    TFT_Print(150, 100, "Touch Test", TFT_WHITE, TFT_BLACK, 2);
}

void Test_Touch(char buffer[], uint16_t touchX, uint16_t touchY){
    if (Touch_IsPressed())
        {
            if (Touch_GetCoordinates(&touchX, &touchY))
            {
                TFT_FillRect(touchX, touchY, 2, 2, TFT_YELLOW);
            }
            
            TFT_Print(196, 190, "Pressed   ", TFT_GREEN, TFT_BLACK, 1);
        }
        else
        {
            TFT_Print(196, 190, "NotPressed", TFT_RED, TFT_BLACK, 1);
        }
        
        sprintf(buffer, "%d   ", touchX); 
        TFT_Print(200, 130, buffer, TFT_WHITE, TFT_BLACK, 2);

        sprintf(buffer, "%d   ", touchY);
        TFT_Print(200, 160, buffer, TFT_WHITE, TFT_BLACK, 2);
}


/*
            Main application
 */
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();
    //==Variables_Initialize==//
    uint16_t touchX = 0, touchY = 0;
    char buffer[32]; 
    //========================//
    //==Background_Initialize==//
    TFT_FillScreen(TFT_BLACK);
    Test_Touch_Init();
    wifi_setup();
    weather_client_init();
    //========================//
    
    while (1) {
        Test_Touch(buffer, touchX, touchY);
        
        wifi_task();
        weather_client_task();
        __delay_ms(1000);
    }
    return 1;
}
/**
 End of File
*/

