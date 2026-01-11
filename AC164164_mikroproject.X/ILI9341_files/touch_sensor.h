#ifndef TOUCH_SENSOR_H
#define TOUCH_SENSOR_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint16_t x;
    uint16_t y;
} Point;

void Touch_Init(void);

bool Touch_IsPressed(void);

bool Touch_GetRaw(uint16_t *x, uint16_t *y);

bool Touch_GetCoordinates(uint16_t *x_pos, uint16_t *y_pos);

bool Is_Btn_Pressed(uint16_t tx, uint16_t ty, uint16_t x, uint16_t y, uint16_t w, uint16_t h);

#endif