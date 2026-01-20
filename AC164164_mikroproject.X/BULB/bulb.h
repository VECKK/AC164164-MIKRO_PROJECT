#ifndef BULB_H
#define BULB_H

#include <stdbool.h>

#define IFTTT_KEY "dgBQmtCD9jgoXoOv65C1Sk"

#define IFTTT_EVENT_OFF "zarowka_off"
#define IFTTT_EVENT_ON  "zarowka_on"

void Turn_Off_Bulb(void);
void Turn_On_Bulb(void);

#endif