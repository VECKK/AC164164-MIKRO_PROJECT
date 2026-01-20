#ifndef CITY_MENU_H
#define CITY_MENU_H

#include <stdint.h>
#include <stdbool.h>

// --- KONFIGURACJA UI POGODY ---
#define HEADER_X      0
#define HEADER_Y      0
#define HEADER_W      320
#define HEADER_H      30

#define SLIDER_X      10
#define SLIDER_Y      202
#define SLIDER_W      180
#define SLIDER_H      36

// --- POZYCJE PRZYCISKÓW ---
#define BUTTON_X      200 
#define BUTTON_W      110
#define BUTTON_H      39

#define LOGOUT_Y      35
#define LIGHT_Y       90
#define EMAIL_Y       145
#define RETURN_Y      200

extern const char* polish_cities[5];

void Draw_Weather_Interface(uint16_t headerColor, char* userName);

void Draw_Return_Button(void);
void Draw_Logout_Button(void);
void Draw_Email_Button(void);
void Draw_City_Menu(void);
void Draw_Light_On_Button(void);
void Draw_Light_Off_Button(void);

void Animate_Logout_Click(void);
void Animate_Sending_Button(void);
void Animate_Sent_Button(void);
void Animate_Light_Button(void);

bool Check_Logout_Touch(uint16_t tx, uint16_t ty);
bool Check_Email_Touch(uint16_t tx, uint16_t ty);
int Check_City_Touch(uint16_t tx, uint16_t ty);
bool Check_Light_On_Touch(uint16_t tx, uint16_t ty);
bool Check_Light_Off_Touch(uint16_t tx, uint16_t ty);

#endif