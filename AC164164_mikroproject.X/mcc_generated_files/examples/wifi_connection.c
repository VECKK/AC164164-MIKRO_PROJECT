#include <stdio.h>
#include <string.h>
#include "../mcc.h"
#include "../winc/include/winc.h"
#include "../winc/include/winc_legacy.h"
#include "../pin_manager.h"
#include "wifi_connection.h"

// Do??czamy grafik?
#include "../../ILI9341_files/tft_gfx.h" 

// --- KONFIGURACJA WYGL?DU PRZYCISKÓW ---
#define BTN_START_X      10   
#define BTN_START_Y      40   
#define BTN_WIDTH        220  
#define BTN_HEIGHT       30   
#define BTN_GAP          10   

// Tekst statusu
#define TEXT_X 20
#define TEXT_Y 240 

// --- DANE SIECI ---
typedef struct {
    char* ssid;
    char* pass;
} NetworkCreds;

NetworkCreds myNetworks[4] = {
    {"UPC20B118",          "yws6npVtqeub"},
    {"iPhone",             "wik 1234"},
    {"UPC6EFBFAF",      "FCwpkcn6wfcv"},
    {"Gonsi S23 Ultra 5G", "12345678"}
};

// --- ZMIENNE GLOBALNE ---
bool wifi_connected = false;
bool wifi_connect_error = false;
static char status_buffer[64];

// --- FUNKCJE WEWN?TRZNE (POMOCNICZE) ---
void winc_register_init(void);

// Funkcja prywatna
void wifi_connect_dynamic(char* ssid, char* password) {
    wifi_connected = false;
    wifi_connect_error = false; 
    
    m2m_wifi_disconnect(); 
    
    TFT_FillRect(0, TEXT_Y, 240, 50, TFT_BLACK); 
    
    sprintf(status_buffer, "Wybrano: %s", ssid);
    TFT_Print(TEXT_X, TEXT_Y, status_buffer, TFT_CYAN, TFT_BLACK, 1);

    TFT_Print(TEXT_X, TEXT_Y + 15, "Szukanie sieci... Czekaj", TFT_WHITE, TFT_BLACK, 1);

    int8_t ret = m2m_wifi_connect(ssid, strlen(ssid),
                            M2M_WIFI_SEC_WPA_PSK, 
                            (void *)password, 
                            M2M_WIFI_CH_ALL);

    if (ret != M2M_SUCCESS) {
        TFT_Print(TEXT_X, TEXT_Y + 30, "Blad inicjalizacji!", TFT_RED, TFT_BLACK, 1);
        wifi_connect_error = true; 
    }
}

// --- FUNKCJE GUI ---

void Draw_Wifi_Menu(void) {
    TFT_FillScreen(TFT_BLACK);
    TFT_Print(10, 10, "WYBIERZ SIEC WI-FI:", TFT_YELLOW, TFT_BLACK, 2);
    
    for(int i=0; i<4; i++) {
        uint16_t y_pos = BTN_START_Y + (i * (BTN_HEIGHT + BTN_GAP));
        
        // Ramka
        TFT_DrawRect(BTN_START_X, y_pos, BTN_WIDTH, BTN_HEIGHT, TFT_WHITE);
        
        // Tekst
        TFT_Print(BTN_START_X + 10, y_pos + (BTN_HEIGHT / 2) - 4, myNetworks[i].ssid, TFT_CYAN, TFT_BLACK, 1);
    }
}

void Wifi_Highlight_Button(int index, uint16_t color) {
    if (index < 0 || index >= 4) return;

    // Obliczamy pozycj? Y
    uint16_t y_pos = BTN_START_Y + (index * (BTN_HEIGHT + BTN_GAP));
    
    TFT_DrawRect(BTN_START_X, y_pos, BTN_WIDTH, BTN_HEIGHT, color);
}

int Check_Wifi_Touch(uint16_t ty) {
    for(int i=0; i<4; i++) {
        uint16_t y_start = BTN_START_Y + (i * (BTN_HEIGHT + BTN_GAP));
        uint16_t y_end = y_start + BTN_HEIGHT;

        if (ty >= y_start && ty <= y_end) {
            return i;
        }
    }
    return -1;
}

void Wifi_Connect_Selection(int index) {
    if(index >= 0 && index < 4) {
        wifi_connect_dynamic(myNetworks[index].ssid, myNetworks[index].pass);
    }
}

// --- FUNKCJE SYSTEMOWE WINC1500 ---

void wifi_setup(void)
{
    winc_register_init();
    winc_adapter_init();

    tstrWifiInitParam param;
    memset(&param, 0, sizeof(param));
    param.pfAppWifiCb = wifi_event_cb;

    int8_t ret = m2m_wifi_init(&param);
    if (ret != M2M_SUCCESS) {
        while(1); 
    }
}

void wifi_task(void)
{
    m2m_wifi_handle_events(NULL);
}

void wifi_event_cb(uint8_t u8WiFiEvent, const void *const pvMsg)
{
    switch(u8WiFiEvent)
    {
    case M2M_WIFI_RESP_CON_STATE_CHANGED:
        {
            tstrM2mWifiStateChanged *pState = (tstrM2mWifiStateChanged *)pvMsg;
            if (pState->u8CurrState == M2M_WIFI_CONNECTED)
            {
                TFT_Print(TEXT_X, TEXT_Y + 15, "Polaczono! Pobieranie IP...", TFT_GREEN, TFT_BLACK, 1);
                wifi_connect_error = false;
            }
            else if (pState->u8CurrState == M2M_WIFI_DISCONNECTED)
            {
                TFT_Print(TEXT_X, TEXT_Y + 15, "Blad: Nie znaleziono!", TFT_RED, TFT_BLACK, 1);
                wifi_connected = false;
                wifi_connect_error = true; 
            }
            break;
        }
        
        case M2M_WIFI_REQ_DHCP_CONF:
        {
            uint8_t *ipAddr = (uint8_t *)pvMsg;
            wifi_connected = true;
            
            sprintf(status_buffer, "IP: %u.%u.%u.%u", 
                    ipAddr[0], ipAddr[1], ipAddr[2], ipAddr[3]);
            TFT_Print(TEXT_X, TEXT_Y + 30, status_buffer, TFT_YELLOW, TFT_BLACK, 1);
            
            LED_BLUE_SetLow();
            break;
        }

    default:
        break;
    }
}

void winc_register_init(void)
{
}