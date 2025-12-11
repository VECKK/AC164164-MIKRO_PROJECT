#include "touch_sensor.h"
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/spi2.h" 

/* Komendy sterownika XPT2046 */
#define CMD_READ_X  0xD0
#define CMD_READ_Y  0x90

void Touch_Init(void) {
    TOUCH_CS_SetHigh();
}

bool Touch_IsPressed(void) {
    // T_IRQ jest niski, gdy ekran jest dotykany.
    return (TOUCH_IRQ_GetValue() == 0);
}

// Funkcja pomocnicza do odczytu z SPI
static uint16_t Touch_ReadSPI(uint8_t command) {
    uint8_t msb, lsb;
    uint16_t result;
    
    TOUCH_CS_SetLow(); 

    SPI2_Exchange8bit(command); 
    
    msb = SPI2_Exchange8bit(0x00);
    
    lsb = SPI2_Exchange8bit(0x00);

    TOUCH_CS_SetHigh(); 
    
    result = ((msb << 8) | lsb) >> 3;
    return result;
}

bool Touch_GetRaw(uint16_t *x, uint16_t *y) {

     if (!Touch_IsPressed()) return false; 

    // Odczytujemy kilka razy i u?redniamy
    uint32_t sum_x = 0, sum_y = 0;
    const int samples = 4;

    for (int i = 0; i < samples; i++) {
        sum_x += Touch_ReadSPI(CMD_READ_X);
        sum_y += Touch_ReadSPI(CMD_READ_Y);
    }

    *x = sum_x / samples;
    *y = sum_y / samples;

    if (*x < 100 || *x > 3800 || *y < 100 || *y > 3800) {
        return false; // Prawdopodobnie brak dotyku (szum)
    }

    return true;
}

long map(long x, long in_min, long in_max, long out_min, long out_max) {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

bool Touch_GetCoordinates(uint16_t *x_pos, uint16_t *y_pos) {
    uint16_t raw_x, raw_y;

    if (!Touch_GetRaw(&raw_x, &raw_y)) return false;

    const uint16_t TS_MINX = 300;
    const uint16_t TS_MAXX = 3800;
    const uint16_t TS_MINY = 200;
    const uint16_t TS_MAXY = 3750;

    const uint16_t SCREEN_W = 320;
    const uint16_t SCREEN_H = 240;

    int16_t px, py;


    px = map(raw_y, TS_MINY, TS_MAXY, 0, SCREEN_W);
    
    py = map(raw_x, TS_MINX, TS_MAXX, 0, SCREEN_H);

    // Ograniczenie (clamping)
    if (px < 0) px = 0;
    if (px >= SCREEN_W) px = SCREEN_W - 1;
    if (py < 0) py = 0;
    if (py >= SCREEN_H) py = SCREEN_H - 1;

    *x_pos = (uint16_t)px;
    *y_pos = (uint16_t)py;

    return true;
}