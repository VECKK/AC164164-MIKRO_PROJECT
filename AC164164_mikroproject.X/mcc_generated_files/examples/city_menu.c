#include "city_menu.h"
#include <stdio.h>
#include <string.h>
#include "../../ILI9341_files/tft_gfx.h" 

// --- KONFIGURACJA LISTY MIAST ---
#define MENU_XSTART      10
#define MENU_YSTART      30
#define MENU_WIDTH       180 
#define MENU_HEIGHT      40
#define SEND_X          200
#define SEND_Y          150  // 50 pikseli wy?ej ni? Return
#define SEND_WIDTH      110
#define SEND_HEIGHT     39

// Definicja tablicy miast
const char* polish_cities[5] = {"Krakow", "Warszawa", "Wroclaw", "Gdansk", "Zakopane"};

void Draw_City_Menu(void) {
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(MENU_XSTART, 10, "Wybierz miasto:", TFT_YELLOW, TFT_BLACK, 2);
    
    for(int i=0; i<5; i++) {
        uint16_t y_pos = MENU_YSTART + (i * MENU_HEIGHT); 
        TFT_DrawRect(MENU_XSTART, y_pos, MENU_WIDTH, 30, TFT_WHITE);
        TFT_Print(MENU_XSTART + 10, y_pos + 8, (char*)polish_cities[i], TFT_CYAN, TFT_BLACK, 2);
    }
    
    Draw_Logout_Button();
}

int Check_City_Touch(uint16_t tx, uint16_t ty) {
    for(int i=0; i<5; i++) {
        uint16_t y_start = MENU_YSTART + (i * MENU_HEIGHT);
        if (ty >= y_start && ty <= y_start + 30 && tx >= MENU_XSTART && tx <= (MENU_XSTART + MENU_WIDTH) ) {
            return i;
        }
    }
    return -1;
}

// --- NOWA FUNKCJA PRZENIESIONA Z MAIN ---
void Draw_Weather_Interface(uint16_t headerColor, char* userName) {
    TFT_FillScreen(TFT_BLACK);
    
    // 1. Nag?�wek
    TFT_FillRect(HEADER_X, HEADER_Y, HEADER_W, HEADER_H, headerColor);
    char headerText[30];
    sprintf(headerText, "POGODA - %s", userName);
    TFT_Print(5, 8, headerText, TFT_BLACK, headerColor, 2);
    
    // 2. Przyciski
    Draw_Return_Button(); 
    Draw_Logout_Button();

    // 3. Suwak
    // Funkcja TFT_Draw_Rainbow_Bar musi by? dost?pna w tft_gfx.h
    TFT_Draw_Rainbow_Bar(SLIDER_X, SLIDER_Y, SLIDER_W, SLIDER_H);
}

void Draw_Return_Button(void) {
    TFT_DrawRect(BUTTON_X, RETURN_Y, BUTTON_W, BUTTON_H, TFT_BLUE);
    TFT_Print(BUTTON_X + 18, RETURN_Y + 14, "Return", TFT_WHITE, TFT_BLACK, 2);
}

void Draw_Logout_Button(void) {
    TFT_DrawRect(BUTTON_X, LOGOUT_Y, BUTTON_W, BUTTON_H, TFT_RED);
    TFT_Print(BUTTON_X + 18, LOGOUT_Y + 14, "LOGOUT", TFT_WHITE, TFT_BLACK, 2);
}

void Draw_Send_Button(void) {
    TFT_DrawRect(SEND_X, SEND_Y, SEND_WIDTH, SEND_HEIGHT, TFT_GREEN);
    TFT_Print(SEND_X + 25, SEND_Y + 14, "Send", TFT_WHITE, TFT_BLACK, 2);
}

void Draw_Send_Button(void) {
    TFT_DrawRect(SEND_X, SEND_Y, SEND_WIDTH, SEND_HEIGHT, TFT_GREEN);
    TFT_Print(SEND_X + 25, SEND_Y + 14, "Send", TFT_WHITE, TFT_BLACK, 2);
}

bool Check_Send_Touch(uint16_t tx, uint16_t ty) {
    if (tx >= SEND_X && tx <= (SEND_X + SEND_WIDTH) &&
        ty >= SEND_Y && ty <= (SEND_Y + SEND_HEIGHT)) {
        return true;
    }
    return false;
}

bool Check_Send_Touch(uint16_t tx, uint16_t ty) {
    if (tx >= SEND_X && tx <= (SEND_X + SEND_WIDTH) &&
        ty >= SEND_Y && ty <= (SEND_Y + SEND_HEIGHT)) {
        return true;
    }
    return false;
}

bool Check_Logout_Touch(uint16_t tx, uint16_t ty) {
    if (tx >= BUTTON_X && tx <= (BUTTON_X + BUTTON_W) &&
        ty >= LOGOUT_Y && ty <= (LOGOUT_Y + BUTTON_H)) {
        return true;
    }
    return false;
}

void Animate_Logout_Click(void) {
    // Rysuje bia?y prostok?t w miejscu przycisku Logout
    TFT_DrawRect(BUTTON_X, LOGOUT_Y, BUTTON_W, BUTTON_H, TFT_WHITE);
}