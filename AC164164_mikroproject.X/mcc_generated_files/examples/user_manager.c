#include "../examples/user_manager.h"
#include "../examples/weather_client.h"
#include "../examples/city_menu.h"
#include "../../ILI9341_files/keypad.h"
#include "../../RFID/pn532.h"

#define FCY 16000000UL
#include <libpic30.h>

// --- DEFINICJA DANYCH U?YTKOWNIKÓW ---
UserProfile users[3] = {
    {"1111", TFT_CYAN,  "Warszawa", "Lukasz",   LUKASZ_EMAIL, {0xAA, 0xFC, 0x98, 0x04}},  
    {"2222", TFT_RED,   "Krakow",   "Kacper",   KACPER_EMAIL, {0xBC, 0x4A, 0x7E, 0x05}}, 
    {"3333", TFT_GREEN, "Rajsko", "Wiktoria", WIKA_EMAIL,   {0x5B, 0x7C, 0x57, 0x1F}} 
};

int currentUserIndex = -1;

// --- IMPLEMENTACJE FUNKCJI ---

int FindUserByCard(PN532_Tag* tag) {
    if (tag->uidLen != 4) return -1; 
    for (int i = 0; i < 3; i++) {
        if (memcmp(tag->uid, users[i].rfid_uid, 4) == 0) {
            return i; 
        }
    }
    return -1; 
}

void Perform_Logout_Logic(AppState* currentStatePtr) {
    Animate_Logout_Click();
    __delay_ms(100); 

    currentUserIndex = -1;

    weather_client_reset(); 

    PN532_Init(); 
    
    TFT_FillScreen(TFT_BLACK);
    Draw_Keypad();
    Update_Pin_Display();

    *currentStatePtr = STATE_LOGIN;
}