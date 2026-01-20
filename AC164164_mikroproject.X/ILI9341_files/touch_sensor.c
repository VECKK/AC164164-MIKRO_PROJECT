#include "touch_sensor.h"
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/spi2.h" 

#ifndef FCY
#define FCY 8000000UL // 16 MHz (Dla 32MHz Fosc)
#endif
#include <libpic30.h>

/* Komendy sterownika XPT2046 */
#define CMD_READ_X  0xD0
#define CMD_READ_Y  0x90

static uint16_t Touch_ReadSPI(uint8_t command) {
    uint8_t msb, lsb;
    uint16_t result;
    
    uint16_t old_con1l = SPI2CON1L;
    uint16_t old_brgl = SPI2BRGL;

    SPI2CON1Lbits.SPIEN = 0;

    // 3. Skonfiguruj pod XPT2046
    // Wzór: F_SCK = FCY / (BRGL + 1). 
    // Przy FCY 8MHz, BRGL=15 daje 500kHz.
    SPI2BRGL = 15; 

    // Wymus tryb 8-bitowy
    SPI2CON1Lbits.MODE16 = 0;
    SPI2CON1Lbits.MODE32 = 0;
    
    SPI2CON1Lbits.SPIEN = 1;

    // --- Transakcja ---
    TOUCH_CS_SetLow();
    __delay_us(10);

    SPI2_Exchange8bit(command);
    
    msb = SPI2_Exchange8bit(0x00);
    lsb = SPI2_Exchange8bit(0x00);

    TOUCH_CS_SetHigh();

    // 4. Przywroc ustawienia dla TFT
    SPI2CON1Lbits.SPIEN = 0;   
    SPI2BRGL = old_brgl;       
    SPI2CON1L = old_con1l;     
    SPI2CON1Lbits.SPIEN = 1;   

    // Przesuni?cie bitowe dla wyniku 12-bitowego
    result = ((msb << 8) | lsb) >> 3;
    return result;
}


void Touch_Init(void) {
    TOUCH_CS_SetHigh();
}

bool Touch_IsPressed(void) {
    return (TOUCH_IRQ_GetValue() == 0);
}

bool Touch_GetRaw(uint16_t *x, uint16_t *y) {
     if (!Touch_IsPressed()) return false; 

    uint32_t sum_x = 0, sum_y = 0;
    const int samples = 4;

    for (int i = 0; i < samples; i++) {
        sum_x += Touch_ReadSPI(CMD_READ_X);
        __delay_us(50); 
        sum_y += Touch_ReadSPI(CMD_READ_Y);
        __delay_us(50);
    }

    *x = sum_x / samples;
    *y = sum_y / samples;

    if (*x == 0 || *y == 0 || *x > 4090 || *y > 4090) return false;

    return true;
}

long map(long x, long in_min, long in_max, long out_min, long out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

bool Touch_GetCoordinates(uint16_t *x_pos, uint16_t *y_pos) {
    uint16_t raw_x, raw_y;

    if (!Touch_GetRaw(&raw_x, &raw_y)) return false;

    const uint16_t SCREEN_W = 320;
    const uint16_t SCREEN_H = 240;

    const uint16_t TS_MINX = 300;
    const uint16_t TS_MAXX = 3800;
    const uint16_t TS_MINY = 200;
    const uint16_t TS_MAXY = 3750;

    long temp_px, temp_py;

    temp_px = map(raw_y, TS_MINY, TS_MAXY, 0, SCREEN_W);
    temp_py = map(raw_x, TS_MINX, TS_MAXX, 0, SCREEN_H);
    
    temp_px = SCREEN_W - temp_px;  
    temp_py = SCREEN_H - temp_py;  

    if (temp_px < 0) temp_px = 0;
    if (temp_px >= SCREEN_W) temp_px = SCREEN_W - 1;

    if (temp_py < 0) temp_py = 0;
    if (temp_py >= SCREEN_H) temp_py = SCREEN_H - 1;

    *x_pos = (uint16_t)temp_px;
    *y_pos = (uint16_t)temp_py;

    return true;
}

bool Is_Btn_Pressed(uint16_t tx, uint16_t ty, uint16_t x, uint16_t y, uint16_t w, uint16_t h) {
    return (tx >= x && tx <= (x + w) && ty >= y && ty <= (y + h));
}