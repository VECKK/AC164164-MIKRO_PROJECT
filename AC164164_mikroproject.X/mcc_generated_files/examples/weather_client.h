#ifndef WEATHER_CLIENT_H
#define WEATHER_CLIENT_H

void weather_client_init(void);
void weather_client_task(void);
void weather_set_city(const char* new_city);
void weather_client_reset(void);
void weather_get_last_data(char* buffer);

#endif	/* WEATHER_CLIENT_H */

