#ifndef USER_MANAGER_H
#define USER_MANAGER_H

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include "../../ILI9341_files/tft_gfx.h"
#include "../../RFID/pn532.h"

// --- KONFIGURACJA EMAIL ---
#define WIKA_EMAIL   "wiktoria.mikro@interia.com"
#define LUKASZ_EMAIL "lukasz.mikro@interia.com"
#define KACPER_EMAIL "mikrokk123@gmail.com"

// --- DEFINICJA STANÓW APLIKACJI (Przeniesiona tutaj, aby by?a wspólna) ---
typedef enum {
    STATE_WIFI_SELECT,
    STATE_CONNECTING,
    STATE_LOGIN,
    STATE_CITY_SELECT,
    STATE_WEATHER
} AppState;

// --- STRUKTURA U?YTKOWNIKA ---
typedef struct {
    char pin[5];            
    uint16_t headerColor;   
    char* startCity;        
    char name[10];
    char* email;
    uint8_t rfid_uid[4]; 
} UserProfile;

// --- ZMIENNE GLOBALNE (Udost?pnione dla innych plików) ---
extern UserProfile users[3];
extern int currentUserIndex;

// --- DEKLARACJE FUNKCJI ---
int FindUserByCard(PN532_Tag* tag);
void Perform_Logout_Logic(AppState* currentStatePtr);

#endif