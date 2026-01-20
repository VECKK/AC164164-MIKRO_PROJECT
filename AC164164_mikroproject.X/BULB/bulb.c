#include "bulb.h"
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/examples/wifi_connection.h"
#include "../mcc_generated_files/winc/socket/socket.h" 
#include "../ILI9341_files/tft_gfx.h" 
#include <string.h>
#include <stdio.h>

#define FCY 16000000UL
#include <libpic30.h>

static SOCKET ifttt_socket = -1;
static volatile bool is_connected = false;
static volatile int8_t socket_error_code = 0;
static volatile uint32_t resolved_ip = 0; 

static void bulb_socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg) {
    if (sock != ifttt_socket) return;
    switch (u8Msg) {
        case SOCKET_MSG_CONNECT: {
            tstrSocketConnectMsg *pstrConnect = (tstrSocketConnectMsg *)pvMsg;
            if (pstrConnect) {
                socket_error_code = pstrConnect->s8Error;
                if (pstrConnect->s8Error >= 0) is_connected = true;
                else is_connected = false;
            }
        } break;
        default: break;
    }
}

static void bulb_dns_cb(uint8_t *pu8DomainName, uint32_t u32IP) {
    if (strstr((char*)pu8DomainName, "maker.ifttt.com")) {
        resolved_ip = u32IP;
    }
}

static void Send_IFTTT_Trigger(const char* event_name) {
    registerSocketCallback(bulb_socket_cb, bulb_dns_cb);
    
    if (resolved_ip == 0) {
        TFT_Print(20, 260, "DNS...", TFT_WHITE, TFT_BLACK, 1);
        gethostbyname((uint8_t *)"maker.ifttt.com"); 
        
        int dns_timeout = 0;
        while (resolved_ip == 0 && dns_timeout < 300) { 
            m2m_wifi_handle_events(NULL);
            __delay_ms(10);
            dns_timeout++;
        }
    }
    
    if (resolved_ip == 0) {
        TFT_Print(20, 260, "Blad DNS!", TFT_RED, TFT_BLACK, 1);
        return;
    }

    is_connected = false;
    socket_error_code = 0;

    struct sockaddr_in addr;
    memset(&addr, 0, sizeof(struct sockaddr_in));
    addr.sin_family = AF_INET;
    addr.sin_port = _htons(443); 
    addr.sin_addr.s_addr = resolved_ip; 

    ifttt_socket = socket(AF_INET, SOCK_STREAM, 1);
    if (ifttt_socket < 0) return;

    char *server_name = "maker.ifttt.com";
    setsockopt(ifttt_socket, SOL_SSL_SOCKET, SO_SSL_SNI, server_name, strlen(server_name));
    int32_t sslOptionEnable = 1;
    setsockopt(ifttt_socket, SOL_SSL_SOCKET, SO_SSL_BYPASS_X509_VERIF, &sslOptionEnable, sizeof(int32_t));

    connect(ifttt_socket, (struct sockaddr *)&addr, sizeof(struct sockaddr_in));
    
    int timeout = 0;
    while (!is_connected && socket_error_code == 0 && timeout < 500) { 
        m2m_wifi_handle_events(NULL);
        __delay_ms(10);
        timeout++;
    }

    if (is_connected) {
        char request[256];
        sprintf(request, 
            "GET /trigger/%s/with/key/%s HTTP/1.1\r\n"
            "Host: maker.ifttt.com\r\n"
            "Connection: close\r\n\r\n", 
            event_name, IFTTT_KEY);

        send(ifttt_socket, (void*)request, strlen(request), 0);
        
        for(int k=0; k<50; k++) { m2m_wifi_handle_events(NULL); __delay_ms(10); }
        
        TFT_Print(20, 260, "Wyslano!   ", TFT_GREEN, TFT_BLACK, 1);
    } 
    else {
        TFT_Print(20, 260, "Blad Polaczenia!", TFT_RED, TFT_BLACK, 1);
    }

    close(ifttt_socket);
    ifttt_socket = -1;
}

void Turn_Off_Bulb(void) {
    Send_IFTTT_Trigger(IFTTT_EVENT_OFF);
}

void Turn_On_Bulb(void) {
    Send_IFTTT_Trigger(IFTTT_EVENT_ON);
}
