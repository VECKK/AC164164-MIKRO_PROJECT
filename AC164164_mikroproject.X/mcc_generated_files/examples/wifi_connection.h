#ifndef WIFI_CONNECTION_H
#define WIFI_CONNECTION_H

#include <stdbool.h>
#include <stdint.h>

extern bool wifi_connected;
extern bool wifi_connect_error;

void wifi_setup(void);
void wifi_task(void);
void wifi_event_cb(uint8_t u8WiFiEvent, const void *const pvMsg);

void Draw_Wifi_Menu(void);
int Check_Wifi_Touch(uint16_t ty);
void Wifi_Connect_Selection(int index);
void Wifi_Highlight_Button(int index, uint16_t color);

#endif