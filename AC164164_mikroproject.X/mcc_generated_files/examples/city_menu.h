#ifndef CITY_MENU_H
#define CITY_MENU_H

#include <stdint.h>
#include <stdbool.h>

// --- KONFIGURACJA UI POGODY (Wsp�lne wymiary) ---
#define HEADER_X      0
#define HEADER_Y      0
#define HEADER_W      320
#define HEADER_H      30

#define SLIDER_X      10
#define SLIDER_Y      202
#define SLIDER_W      180
#define SLIDER_H      36

// --- POZYCJE PRZYCISK�W ---
#define BUTTON_X      200 
#define BUTTON_W      110
#define BUTTON_H      39
#define LOGOUT_Y      40  // Prawy G�RNY r�g
#define RETURN_Y      200 // Prawy DOLNY r�g

// Deklaracja tablicy miast
extern const char* polish_cities[5];

// --- FUNKCJE GUI ---

// Rysuje menu miast
void Draw_City_Menu(void);

// Sprawdza dotyk na li?cie miast
int Check_City_Touch(uint16_t tx, uint16_t ty);

// Rysuje ca?y interfejs pogody (Nag?�wek, Suwak, Przyciski)
void Draw_Weather_Interface(uint16_t headerColor, char* userName);

// Rysuje przyciski
void Draw_Return_Button(void);
void Draw_Logout_Button(void);

// Animacja klikni?cia wylogowania (migni?cie na bia?o)
void Animate_Logout_Click(void);

void Draw_Send_Button(void);
bool Check_Send_Touch(uint16_t tx, uint16_t ty);

// Sprawdzenie dotyku przycisk�w
bool Check_Logout_Touch(uint16_t tx, uint16_t ty);

#endif