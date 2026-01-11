#ifndef KEYPAD_H
#define KEYPAD_H

#include <stdbool.h>
#include <stdint.h>
#include <string.h>

void Draw_Keypad(void);
void Update_Pin_Display(void);

int Handle_Login_Touch(const char* pin1, const char* pin2, const char* pin3, uint16_t tx, uint16_t ty);

char* get_user_email(void);

#endif