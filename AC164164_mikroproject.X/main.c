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

void Test_Touch(void) {
    uint16_t x = 0, y = 0; // Lokalne zmienne na wspó?rz?dne
    char buffer[32];       // Lokalny bufor na tekst

    // Sprawdzamy czy fizycznie jest nacisk
    if (Touch_IsPressed()) {
        
        // Próbujemy odczyta? i przeliczy? wspó?rz?dne
        if (Touch_GetCoordinates(&x, &y)) {
            
            // 1. RYSOWANIE PUNKTU
            // Rysujemy kwadrat 3x3 w miejscu dotyku (kolor ?ó?ty)
            // Odejmujemy 1 od x i y, aby ?rodek kwadratu by? dok?adnie pod palcem
            TFT_FillRect(x - 1, y - 1, 3, 3, TFT_YELLOW);

            // 2. WY?WIETLANIE STATUSU I WSPÓ?RZ?DNYCH
            TFT_Print(196, 190, "Pressed   ", TFT_GREEN, TFT_BLACK, 1);

            sprintf(buffer, "%d   ", x); // Spacje na ko?cu czyszcz? poprzednie cyfry
            TFT_Print(200, 130, buffer, TFT_WHITE, TFT_BLACK, 2);

            sprintf(buffer, "%d   ", y);
            TFT_Print(200, 160, buffer, TFT_WHITE, TFT_BLACK, 2);
        }
    } else {
        // Je?li brak dotyku
        TFT_Print(196, 190, "NotPressed", TFT_RED, TFT_BLACK, 1);
    }
}


/*
            Main application
 */
/*
            Main application
 */
int main(void) {
    SYSTEM_Initialize();
    TFT_Init();
    Touch_Init();

    //==Background_Initialize==//
    TFT_FillScreen(TFT_BLACK);
    Test_Touch_Init();
    
    wifi_setup();
    weather_client_init();
    //========================//
    
    while (1) {
        Test_Touch();
        
        wifi_task();
        weather_client_task();
        

        __delay_ms(1); 
    }
    return 1;
}
/**
 End of File
*/

