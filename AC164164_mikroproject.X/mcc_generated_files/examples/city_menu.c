#include "city_menu.h"
#include <stdio.h>
#include <string.h>
#include "../../ILI9341_files/tft_gfx.h" 

// Definicja tablicy miast
const char* polish_cities[5] = {"Krakow", "Warszawa", "Wroclaw", "Gdansk", "Zakopane"};

void Draw_City_Menu(void) {
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(10, 10, "Select a city:", TFT_YELLOW, TFT_BLACK, 2);
    
    for(int i=0; i<5; i++) {
        uint16_t y_pos = 50 + (i * 45); // Rozmieszczenie przycisków w pionie
        
        // Rysujemy ramk?
        TFT_DrawRect(10, y_pos, 220, 35, TFT_WHITE);
        
        // Wypisujemy nazw? miasta
        // Rzutowanie na (char*) jest bezpieczne, bo TFT_Print nie modyfikuje tekstu
        TFT_Print(20, y_pos + 8, (char*)polish_cities[i], TFT_CYAN, TFT_BLACK, 2);
    }
}

int Check_City_Touch(uint16_t ty) {
    for(int i=0; i<5; i++) {
        uint16_t y_start = 50 + (i * 45);
        // Sprawdzamy czy dotyk mie?ci si? w pionowym obszarze przycisku
        if (ty >= y_start && ty <= y_start + 35) {
            return i;
        }
    }
    return -1;
}

void Draw_Return_Button(void) {
    // Rysujemy przycisk powrotu na dole ekranu (poni?ej danych pogodowych)
    // Dane s? na Y=100, 140, 180. Przycisk damy na Y=270
    TFT_FillRect(10, 270, 220, 40, TFT_RED);
    TFT_Print(40, 280, "Return", TFT_WHITE, TFT_RED, 2);
}
