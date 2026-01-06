#ifndef KEYPAD_H
#define KEYPAD_H

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

void Draw_Keypad(void);
void Update_Pin_Display(void);

// Zmiana: Funkcja przyjmuje 3 piny i zwraca ID u?ytkownika (0-2) lub -1
int Handle_Login_Touch(const char* pin1, const char* pin2, const char* pin3, uint16_t tx, uint16_t ty);

#endif