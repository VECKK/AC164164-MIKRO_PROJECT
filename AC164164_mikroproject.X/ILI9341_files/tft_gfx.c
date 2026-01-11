/*
 * tft_gfx.c
 * Implementacja sterownika ILI9341 + Grafika + Tekst
 */

#include "tft_gfx.h"
#include "../mcc_generated_files/spi2.h"
#include "../mcc_generated_files/pin_manager.h"

#ifndef FCY
#define FCY 8000000UL // 16 MHz (Dla 32MHz Fosc)
#endif
#include <libpic30.h>

#include "glcdfont.c" 

// --- Funkcje pomocnicze SPI ---

void TFT_WriteCommand(uint8_t cmd) {
    TFT_DC_SetLow();
    TFT_CS_SetLow();
    SPI2_Exchange8bit(cmd);
    TFT_CS_SetHigh();
}

void TFT_WriteData(uint8_t data) {
    TFT_DC_SetHigh();
    TFT_CS_SetLow();
    SPI2_Exchange8bit(data);
    TFT_CS_SetHigh();
}

// --- Funkcje Inicjalizacji ---

void TFT_Init(void) {
    TFT_RST_SetHigh();
    __delay_ms(5);
    TFT_RST_SetLow();
    __delay_ms(20);
    TFT_RST_SetHigh();
    __delay_ms(150);

    TFT_WriteCommand(0x01); // Software Reset
    __delay_ms(150);
    TFT_WriteCommand(0x11); // Sleep Out
    __delay_ms(150);
    TFT_WriteCommand(0x3A); // Pixel Format
    TFT_WriteData(0x55);    // 16-bit
    TFT_WriteCommand(0x29); // Display ON
    __delay_ms(150);
    
    // Ustawienie orientacji (opcjonalne)
    TFT_WriteCommand(0x36); // Memory Access Control
    TFT_WriteData(0x20);
}

void TFT_SetAddressWindow(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1) {
    TFT_WriteCommand(0x2A); // Kolumna
    TFT_WriteData(x0 >> 8);
    TFT_WriteData(x0 & 0xFF);
    TFT_WriteData(x1 >> 8);
    TFT_WriteData(x1 & 0xFF);

    TFT_WriteCommand(0x2B); // Wiersz
    TFT_WriteData(y0 >> 8);
    TFT_WriteData(y0 & 0xFF);
    TFT_WriteData(y1 >> 8);
    TFT_WriteData(y1 & 0xFF);

    TFT_WriteCommand(0x2C); // Zapis do pamieci
}

// --- Funkcje Rysowania ---

void TFT_DrawPixel(uint16_t x, uint16_t y, uint16_t color) {
    if((x >= TFT_WIDTH) || (y >= TFT_HEIGHT)) return;

    TFT_SetAddressWindow(x, y, x, y);

    TFT_DC_SetHigh();
    TFT_CS_SetLow();
    SPI2_Exchange8bit(color >> 8);
    SPI2_Exchange8bit(color & 0xFF);
    TFT_CS_SetHigh();
}

void TFT_FillRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    if((x >= TFT_WIDTH) || (y >= TFT_HEIGHT)) return;
    if((x + w - 1) >= TFT_WIDTH)  w = TFT_WIDTH  - x;
    if((y + h - 1) >= TFT_HEIGHT) h = TFT_HEIGHT - y;

    TFT_SetAddressWindow(x, y, x+w-1, y+h-1);

    TFT_DC_SetHigh();
    TFT_CS_SetLow();

    uint8_t hi = color >> 8;
    uint8_t lo = color & 0xFF;
    
    uint32_t count = (uint32_t)w * h;
    while(count--) {
        SPI2_Exchange8bit(hi);
        SPI2_Exchange8bit(lo);
    }
    TFT_CS_SetHigh();
}

void TFT_FillScreen(uint16_t color) {
    TFT_FillRect(0, 0, TFT_WIDTH, TFT_HEIGHT, color);
}

// --- Funkcje Tekstowe ---

// Rysuje pojedynczy znak
void TFT_DrawChar(uint16_t x, uint16_t y, char c, uint16_t color, uint16_t bg, uint8_t size) {
    if((x >= TFT_WIDTH) || (y >= TFT_HEIGHT)) return;

    // Standardowa czcionka 5x7 w glcdfont.c
    // "font" to nazwa tablicy w pliku glcdfont.c
    
    for (int8_t i = 0; i < 5; i++) { // 5 kolumn szeroko?ci
        uint8_t line = font[(c * 5) + i];
        
        for (int8_t j = 0; j < 8; j++, line >>= 1) { // 8 pikseli wysoko?ci
            if (line & 1) {
                if (size == 1)
                    TFT_DrawPixel(x + i, y + j, color);
                else
                    TFT_FillRect(x + (i * size), y + (j * size), size, size, color);
            } else if (bg != color) {
                if (size == 1)
                    TFT_DrawPixel(x + i, y + j, bg);
                else
                    TFT_FillRect(x + (i * size), y + (j * size), size, size, bg);
            }
        }
    }
}

// Rysuje caly ciag znaków (string)
void TFT_Print(uint16_t x, uint16_t y, char *str, uint16_t color, uint16_t bg, uint8_t size) {
    while (*str) {
        // Przejscie do nowej linii, jesli wyjdziemy poza ekran
        if (x + (size * 6) >= TFT_WIDTH) {
            x = 0;
            y += size * 8;
        }
        
        TFT_DrawChar(x, y, *str, color, bg, size);
        x += size * 6; // Przesun kursor (5 pikseli znak + 1 odst?p)
        str++;
    }
}

// Rysuje pusty prostok?t (obrys)
void TFT_DrawRect(uint16_t x, uint16_t y, uint16_t w, uint16_t h, uint16_t color) {
    // Rysowanie 4 linii za pomoc? FillRect
    
    // Górna kraw?d?
    TFT_FillRect(x, y, w, 1, color);
    
    // Dolna kraw?d?
    TFT_FillRect(x, y + h - 1, w, 1, color);
    
    // Lewa kraw?d?
    TFT_FillRect(x, y, 1, h, color);
    
    // Prawa kraw?d?
    TFT_FillRect(x + w - 1, y, 1, h, color);
}

// Konwersja 0-255 na RGB565
uint16_t Color_Wheel(uint8_t pos) {
    pos = 255 - pos;
    uint8_t r, g, b;
    if (pos < 85) {
        r = 255 - pos * 3; g = 0; b = pos * 3;
    } else if (pos < 170) {
        pos -= 85; r = 0; g = pos * 3; b = 255 - pos * 3;
    } else {
        pos -= 170; r = pos * 3; g = 255 - pos * 3; b = 0;
    }
    return ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | (b >> 3);
}

// Rysowanie paska t?czy
void TFT_Draw_Rainbow_Bar(uint16_t x, uint16_t y, uint16_t w, uint16_t h) {
    for (uint16_t i = 0; i < w; i++) {
        uint8_t hue = (i * 255) / w;
        TFT_FillRect(x + i, y, 1, h, Color_Wheel(hue));
    }
    TFT_DrawRect(x - 1, y - 1, w + 2, h + 2, TFT_WHITE); // Ramka
}
