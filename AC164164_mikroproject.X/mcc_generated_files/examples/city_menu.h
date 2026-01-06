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

// Pozycje Y (Prawa kolumna)
#define LOGOUT_Y      40   // Góra
#define EMAIL_Y       155  // Nad Returnem
#define RETURN_Y      200  // Dó?

// Deklaracja tablicy miast
extern const char* polish_cities[5];

// --- FUNKCJE GUI ---
void Draw_City_Menu(void);
int Check_City_Touch(uint16_t tx, uint16_t ty);

void Draw_Weather_Interface(uint16_t headerColor, char* userName);

// Rysowanie przycisków
void Draw_Return_Button(void);
void Draw_Logout_Button(void);
void Draw_Email_Button(void);

// Animacje
void Animate_Logout_Click(void);
void Animate_Email_Click(void);

// Sprawdzanie dotyku
bool Check_Logout_Touch(uint16_t tx, uint16_t ty);
bool Check_Email_Touch(uint16_t tx, uint16_t ty);

#endif