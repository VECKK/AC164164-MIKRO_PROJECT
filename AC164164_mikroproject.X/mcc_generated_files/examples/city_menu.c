#include "city_menu.h"
#include <stdio.h>
#include <string.h>
#include "../../ILI9341_files/tft_gfx.h" 


#define MENU_XSTART     10
#define MENU_YSTART     30
#define MENU_WIDTH      190
#define MENU_HEIGHT     40
#define RETURN_X        200
#define RETURN_Y        200
#define RETURN_WIDTH    110
#define RETURN_HEIGHT   39

// Definicja tablicy miast
const char* polish_cities[5] = {"Krakow", "Warszawa", "Wroclaw", "Gdansk", "Zakopane"};

void Draw_City_Menu(void) {
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(MENU_XSTART, 10, "Select a city:", TFT_YELLOW, TFT_BLACK, 2);
    
    for(int i=0; i<5; i++) {
        uint16_t y_pos = MENU_YSTART + (i * MENU_HEIGHT); // Rozmieszczenie przycisków w pionie
        
        // Rysujemy ramk?
        TFT_DrawRect(MENU_XSTART, y_pos, MENU_WIDTH, 30, TFT_WHITE);
        
        // Wypisujemy nazw? miasta
        // Rzutowanie na (char*) jest bezpieczne, bo TFT_Print nie modyfikuje tekstu
        TFT_Print(MENU_XSTART + 10, y_pos + 8, (char*)polish_cities[i], TFT_CYAN, TFT_BLACK, 2);
    }
}

int Check_City_Touch(uint16_t tx, uint16_t ty) {
    for(int i=0; i<5; i++) {
        uint16_t y_start = MENU_YSTART + (i * MENU_HEIGHT);
        // Sprawdzamy czy dotyk mie?ci si? w pionowym obszarze przycisku
        if (ty >= y_start && ty <= y_start + 30 && tx >= MENU_XSTART && tx <= (MENU_XSTART + MENU_WIDTH) ) {
            return i;
        }
    }
    return -1;
}

void Draw_Return_Button(void) {
    // Rysujemy przycisk powrotu na dole ekranu (poni?ej danych pogodowych)
    // Dane s? na Y=100, 140, 180. Przycisk damy na Y=270
    TFT_DrawRect(RETURN_X, RETURN_Y, RETURN_WIDTH, RETURN_HEIGHT, TFT_RED);
    TFT_Print(RETURN_X + 18, RETURN_Y + 14, "Return", TFT_WHITE, TFT_BLACK, 2);
}
