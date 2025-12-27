#include <stdio.h>
#include <string.h>
#include "../mcc.h"
#include "../winc/include/winc.h"
#include "../winc/include/winc_legacy.h"
#include "../pin_manager.h"
#include "wifi_connection.h"
// Dodajemy obs?ug? ekranu tutaj, aby wy?wietla? status
#include "../../ILI9341_files/tft_gfx.h"

#define TEXT_X 20
#define TEXT_Y 190

/* ===================== PROTOTYPY ===================== */
void winc_register_init(void);

/* ===================== ZMIENNE GLOBALNE ===================== */
bool wifi_connected = false;
static char status_buffer[64]; // Bufor na komunikaty statusowe

/* ===================== FUNKCJE ===================== */

/**
 * Initialization function (NON-BLOCKING)
 */
void wifi_setup(void)
{
    TFT_Print(TEXT_X, TEXT_Y, "Init Wi-Fi...", TFT_WHITE, TFT_BLACK, 1);

    winc_register_init();
    winc_adapter_init();

    tstrWifiInitParam param;
    memset(&param, 0, sizeof(param));
    param.pfAppWifiCb = wifi_event_cb;

    /* Wi-Fi initialization */
    int8_t ret = m2m_wifi_init(&param);
    if (ret != M2M_SUCCESS)
    {
        TFT_Print(TEXT_X, TEXT_Y + 10, "Wi-Fi Init Error!", TFT_RED, TFT_BLACK, 1);
        while(1); // Tu zostawiamy while tylko dla b??du krytycznego sprz?tu
    }

    /* Wi-Fi connection */
    sprintf(status_buffer, "Connecting to: %s", WLAN_SSID);
    TFT_Print(TEXT_X, TEXT_Y + 10, status_buffer, TFT_WHITE, TFT_BLACK, 1);

    ret = m2m_wifi_connect((char *)WLAN_SSID,
                           strlen(WLAN_SSID),
                           WLAN_AUTH,
                           (void *)WLAN_PSK,
                           M2M_WIFI_CH_ALL);
    if (ret != M2M_SUCCESS)
    {
        TFT_Print(TEXT_X, TEXT_Y + 20, "Conn. Error!", TFT_RED, TFT_BLACK, 1);
    }
}

/**
 * To funkcja, któr? musisz wywo?ywa? w p?tli while(1) w main()
 */
void wifi_task(void)
{
    // Obs?uga zdarze? Wi-Fi (nieblokuj?ca)
    m2m_wifi_handle_events(NULL);
}

/**
 * Callback Wi-Fi
 */
void wifi_event_cb(uint8_t u8WiFiEvent, const void *const pvMsg)
{
    switch(u8WiFiEvent)
    {
    case M2M_WIFI_RESP_CON_STATE_CHANGED:
        {
            tstrM2mWifiStateChanged *pState = (tstrM2mWifiStateChanged *)pvMsg;
            if (pState->u8CurrState == M2M_WIFI_CONNECTED)
            {
                TFT_Print(TEXT_X, TEXT_Y + 20, "Wi-Fi Connected! Wait DHCP...", TFT_GREEN, TFT_BLACK, 1);
            }
            else if (pState->u8CurrState == M2M_WIFI_DISCONNECTED)
            {
                TFT_Print(TEXT_X, TEXT_Y + 20, "Disconnected! Reconnecting...", TFT_RED, TFT_BLACK, 1);
                wifi_connected = false;
                m2m_wifi_connect((char *)WLAN_SSID, strlen(WLAN_SSID),
                                 WLAN_AUTH, (void *)WLAN_PSK, M2M_WIFI_CH_ALL);
            }
            break;
        }
        
        case M2M_WIFI_REQ_DHCP_CONF:
        {
            uint8_t *ipAddr = (uint8_t *)pvMsg;
            wifi_connected = true;
            
            // Wy?wietlenie IP na ekranie
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