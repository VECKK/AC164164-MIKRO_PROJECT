/**
 *
 * \file
 *
 * \brief WINC1500 Example.
 *
 * Copyright (c) 2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip
 * software and any derivatives exclusively with Microchip products.
 * It is your responsibility to comply with third party license terms applicable
 * to your use of third party software (including open source software) that
 * may accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE
 * LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL
 * LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE
 * SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT
 * ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY
 * RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * \asf_license_stop
 *
 */
/*
 * Support and FAQ: visit <a href="https://www.microchip.com/support/">Microchip Support</a>
 */

#include <stdio.h>
#include <string.h>
#include "../mcc.h"
#include "../winc/include/winc.h"
#include "../winc/include/winc_legacy.h"
#include "../pin_manager.h"

/* ===================== PROTOTYPY ===================== */
void winc_register_init(void);
static void wifi_event_cb(uint8_t u8WiFiEvent, const void *const pvMsg);

/* ===================== ZMIENNE GLOBALNE ===================== */
bool wifi_connected = false;

/* ===================== FUNKCJE ===================== */

/**
 * Initialization function and Wi-Fi connection
 */

void wifi_connection(void)
{
    printf("\r\nModule initialization...\r\n");

    winc_register_init();
    winc_adapter_init();

    tstrWifiInitParam param;
    memset(&param, 0, sizeof(param));
    param.pfAppWifiCb = wifi_event_cb;

    /* Wi-Fi initialization */
    int8_t ret = m2m_wifi_init(&param);
    if (ret != M2M_SUCCESS)
    {
        printf("Wi-Fi initialization error! Code: %d\r\n", ret);
        while(1);
    }

    /* Wi-Fi connection */
    printf("Connecting to a Wi-Fi network: %s\r\n", WLAN_SSID);
    ret = m2m_wifi_connect((char *)WLAN_SSID,
                           strlen(WLAN_SSID),
                           WLAN_AUTH,
                           (void *)WLAN_PSK,
                           M2M_WIFI_CH_ALL);
    if (ret != M2M_SUCCESS)
    {
        printf("Connection error! Code: %d\r\n", ret);
        while(1);
    }

    while(1)
    {
        m2m_wifi_handle_events(NULL);
    }
}

/**
 *  Callback Wi-Fi
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
                printf("Connected to the network! Waiting for DHCP address...\r\n");
            }
            else if (pState->u8CurrState == M2M_WIFI_DISCONNECTED)
            {
                printf("Disconnected. Attempting to reconnect...\r\n");
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
            printf("IP address received: %u.%u.%u.%u\r\n",
                   ipAddr[0], ipAddr[1], ipAddr[2], ipAddr[3]);
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
