#ifndef TOUCH_SENSOR_H
#define TOUCH_SENSOR_H

#include <stdint.h>
#include <stdbool.h>

// Struktura przechowuj?ca wspó?rz?dne
typedef struct {
    uint16_t x;
    uint16_t y;
} Point;

// Inicjalizacja
void Touch_Init(void);

// Sprawdza, czy ekran jest naci?ni?ty (na podstawie pinu IRQ)
bool Touch_IsPressed(void);

// Pobiera surowe dane z przetwornika (0-4095)
bool Touch_GetRaw(uint16_t *x, uint16_t *y);

// Pobiera wspó?rz?dne przeliczone na piksele ekranu
bool Touch_GetCoordinates(uint16_t *x_pos, uint16_t *y_pos);

#endif