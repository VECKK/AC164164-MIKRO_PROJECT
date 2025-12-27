/* * File:   keypad.c
 * Author: User
 */

#include "keypad.h"
#include "tft_gfx.h"
#include "touch_sensor.h"

// Definicja FCY dla __delay_ms (musi by? przed libpic30.h)
#ifndef FCY
#define FCY 16000000UL 
#endif
#include <libpic30.h>

// --- Konfiguracja Klawiatury ---
#define KEY_W 50
#define KEY_H 36
#define KEY_GAP 8
#define KEY_START_X 20
#define KEY_START_Y 20
#define UPDATE_PIN_X 30
#define UPDATE_PIN_Y 2

// Dane u?ytkownika
static char pinBuffer[5] = ""; 
const char USER_PIN[] = "1234"; 


void Draw_Keypad(void) {
    TFT_FillScreen(TFT_BLACK);    
    // Rysowanie pola na wpisany kod (gwiazdki)
    TFT_FillRect(KEY_START_X, KEY_START_Y +(KEY_H + KEY_GAP)* 4 , KEY_START_X +(KEY_W + KEY_GAP)* 3, 2, TFT_WHITE); 
    
    char labels[12][3] = {"1","2","3", "4","5","6", "7","8","9", "C","0","OK"};
    
    for(int i=0; i<12; i++) {
        int row = i / 3;
        int col = i % 3;
        
        uint16_t x = KEY_START_X + col * (KEY_W + KEY_GAP);
        uint16_t y = KEY_START_Y + row * (KEY_H + KEY_GAP);
        
        // --- DOBÓR KOLORÓW Z POPRAWK? DLA EKRANU BGR ---
        // Je?li ekran zamienia R z B, musimy wysy?a? odwrotnie:
        uint16_t color;
        if (i == 9) {
            // Przycisk "C" ma by? CZERWONY -> wysy?amy BLUE
            color = TFT_BLUE; 
        } else if (i == 11) {
            // Przycisk "OK" -> ZIELONY
            color = TFT_GREEN; 
        } else {
            // Cyfry maj? by? NIEBIESKIE -> wysy?amy RED
            color = TFT_RED; 
        }

        TFT_FillRect(x, y, KEY_W, KEY_H, color);
        TFT_Print(x + 20, y + 10, labels[i], TFT_WHITE, color, 2);
    }
}

void Update_Pin_Display(void) {
    char mask[5] = "    ";
    int len = strlen(pinBuffer);
    for(int i=0; i<len; i++) mask[i] = '*'; 
    
    TFT_FillRect(UPDATE_PIN_X, UPDATE_PIN_Y, 100, 16, TFT_BLACK); 
    TFT_Print(UPDATE_PIN_X + 20, UPDATE_PIN_Y, mask, TFT_YELLOW, TFT_BLACK, 2);
}

bool Handle_Login_Touch(uint16_t tx, uint16_t ty) {
    char keys[12] = {'1','2','3', '4','5','6', '7','8','9', 'C','0','K'}; 
    bool loginSuccess = false;

    for(int i=0; i<12; i++) {
        int row = i / 3;
        int col = i % 3;
        uint16_t bx = KEY_START_X + col * (KEY_W + KEY_GAP);
        uint16_t by = KEY_START_Y + row * (KEY_H + KEY_GAP);
        
        if (Is_Btn_Pressed(tx, ty, bx, by, KEY_W, KEY_H)) {
            char key = keys[i];
            
            // Animacja klikni?cia
            TFT_FillRect(bx, by, KEY_W, KEY_H, TFT_WHITE);
            __delay_ms(100);
            
            // --- Przywracanie koloru (z poprawk? BGR) ---
            uint16_t color;
            if (i == 9) color = TFT_BLUE;      // Czerwony (jako Blue)
            else if (i == 11) color = TFT_GREEN; 
            else color = TFT_RED;              // Niebieski (jako Red)
            
            TFT_FillRect(bx, by, KEY_W, KEY_H, color);
            char label[3] = {key == 'K' ? 'O' : key, key == 'K' ? 'K' : 0, 0};
            TFT_Print(bx + 20, by + 10, label, TFT_WHITE, color, 2);

            // Logika PIN
            int len = strlen(pinBuffer);
            
            if (key == 'C') { 
                if (len > 0) pinBuffer[len-1] = 0;
            } 
            else if (key == 'K') { 
                if (strcmp(pinBuffer, USER_PIN) == 0) {
                    // --- PIN POPRAWNY ---
                    TFT_FillScreen(TFT_BLACK);
                    TFT_Print(80, 100, "LOGOWANIE...", TFT_GREEN, TFT_BLACK, 2);
                    __delay_ms(1000);
                    
                    // Czy?cimy ekran pod nast?pny etap
                    TFT_FillScreen(TFT_BLACK); 
                    TFT_Print(10, 70, "POGODA DLA: KRAKOW", TFT_WHITE, TFT_BLACK, 1);
                    
                    loginSuccess = true; // Zwracamy sukces!
                } else {
                    // --- PIN B??DNY ---
                    TFT_FillRect(100, 45, 120, 20, TFT_BLACK); 
                    // Komunikat na czerwono (wysy?amy BLUE)
                    TFT_Print(100, 45, "BLEDNY KOD!", TFT_BLUE, TFT_BLACK, 1);
                    __delay_ms(1000);
                    TFT_FillRect(100, 45, 120, 20, TFT_BLACK); // Wyczy?? komunikat
                    
                    pinBuffer[0] = 0; 
                }
            } 
            else if (len < 4) { 
                pinBuffer[len] = key;
                pinBuffer[len+1] = 0;
            }
            if(!loginSuccess) Update_Pin_Display();
            while(Touch_IsPressed()); // Debouncing
            
            return loginSuccess; // Wyjd? z funkcji po obs?u?eniu klikni?cia
        }
    }
    return false;
}