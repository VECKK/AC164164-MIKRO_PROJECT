#include "test_functions.h"
#include <stdio.h>
#include "../../ILI9341_files/tft_gfx.h" // Upewnij si?, ?e ?cie?ka jest poprawna

/**
 * Prosty test "Rybki" - sprawdza kolory R, G, B i czyszczenie ekranu.
 */
void test_tft_basic(void)
{
    // Czerwony ekran
    TFT_FillScreen(TFT_RED);
    TFT_Print(10, 10, "RED SCREEN", TFT_BLACK, TFT_RED, 2);
    // Tu u?ywamy p?tli opó?niaj?cej tylko dla testu startowego
    for(volatile long i=0; i<1000000; i++);

    // Zielony ekran
    TFT_FillScreen(TFT_GREEN);
    TFT_Print(10, 50, "GREEN SCREEN", TFT_BLACK, TFT_GREEN, 2);
    for(volatile long i=0; i<1000000; i++);

    // Niebieski ekran
    TFT_FillScreen(TFT_BLUE);
    TFT_Print(10, 90, "BLUE SCREEN", TFT_WHITE, TFT_BLUE, 2);
    for(volatile long i=0; i<1000000; i++);

    // Powrót do czarnego (gotowo?? do pracy)
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(10, 10, "System Ready!", TFT_WHITE, TFT_BLACK, 1);
}

/**
 * Symuluje odebranie danych z Internetu.
 * U?yj tego, ?eby ustawi? sobie idealnie pozycje tekstów (X, Y)
 * bez konieczno?ci czekania na po??czenie Wi-Fi.
 */
void test_weather_layout(void)
{
    TFT_FillScreen(TFT_BLACK);

    char buff[64];

    // Symulacja: Wy?wietlamy nag?ówek
    TFT_Print(10, 10, "LAYOUT TEST MODE", TFT_RED, TFT_BLACK, 1);

    // 1. Symulacja Miasta
    sprintf(buff, "M: Warszawa");
    TFT_Print(10, 100, buff, TFT_YELLOW, TFT_BLACK, 2);

    // 2. Symulacja Temperatury
    sprintf(buff, "T: 24.50 C");
    TFT_Print(10, 140, buff, TFT_WHITE, TFT_BLACK, 2);

    // 3. Symulacja Warunków
    sprintf(buff, "W: Clouds");
    TFT_Print(10, 180, buff, TFT_CYAN, TFT_BLACK, 2);
    
    // Rysujemy ramk? dla orientacji (opcjonalnie)
    TFT_DrawRect(5, 95, 230, 120, TFT_WHITE);
}