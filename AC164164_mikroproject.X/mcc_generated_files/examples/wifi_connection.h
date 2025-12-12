#ifndef WIFI_CONNECTION_H_INCLUDED
#define WIFI_CONNECTION_H_INCLUDED

#include <stdbool.h>
#include <stdint.h>

extern bool wifi_connected;

// Rozdzielamy inicjalizacj? od zadania cyklicznego
void wifi_setup(void);
void wifi_task(void);

// Callback pozostaje dost?pny
void wifi_event_cb(uint8_t u8WiFiEvent, const void *const pvMsg);

#endif /* WIFI_CONNECTION_H_INCLUDED */