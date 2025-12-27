#include "weather_client.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#include "../examples/wifi_connection.h" // Upewnij si?, ?e ?cie?ka jest poprawna
#include "../winc/socket/socket.h"
#include "../../ILI9341_files/tft_gfx.h"

/* ===================== KONFIG ===================== */
#define WEATHER_SERVER_NAME   "api.openweathermap.org"
#define WEATHER_SERVER_PORT   80
#define WEATHER_API_KEY       "b2cc6d9d9380482947d40baf1ccb8c54"
#define CITY_NAME             "Krakow"
#define BUFFER_SIZE           1024

/* ===================== ZMIENNE GLOBALNE ===================== */
static SOCKET tcp_client_socket = -1;
static uint32_t weather_server_ip = 0;
static bool server_resolved = false;
static bool connection_ready = false;
static char http_request[BUFFER_SIZE];
static uint8_t recv_buffer[BUFFER_SIZE];
static char display_buffer[64]; // Pomocniczy bufor do sprintf

/* ===================== PROTOTYPY ===================== */
static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg);
static void resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP);

/**
 * Initialization
 */
void weather_client_init(void)
{
    // Opcjonalnie wyczy?? obszar statusu pogody
}

void weather_client_task(void)
{
    // Uruchamiamy pobieranie tylko gdy jest Wi-Fi i nie jeste?my w trakcie po??czenia
    if (wifi_connected && !connection_ready && tcp_client_socket == -1)
    {
        registerSocketCallback(socket_cb, resolve_cb);
        gethostbyname((const char *)WEATHER_SERVER_NAME);
        
        // Ustawiamy flag?, ?eby nie wywo?ywa? DNS w kó?ko
        connection_ready = true; // Tymczasowo blokujemy ponowne wej?cie
    }
}

/**
 * CALLBACK DNS
 */
static void resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP)
{
    if (u32ServerIP != 0)
    {
        weather_server_ip = u32ServerIP;
        server_resolved = true;
        

        /* Open socket TCP */
        tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0);
        if (tcp_client_socket < 0)
        {
            connection_ready = false; 
            return;
        }

        struct sockaddr_in addr;
        addr.sin_family = AF_INET;
        addr.sin_port = _htons(WEATHER_SERVER_PORT);
        addr.sin_addr.s_addr = weather_server_ip;

        if (connect(tcp_client_socket, (struct sockaddr *)&addr, sizeof(addr)) != SOCK_ERR_NO_ERROR)
        {
            connection_ready = false;
        }
    }
    else
    {
        connection_ready = false;
    }
}

static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg)
{
    tstrSocketConnectMsg *pstrConnect = (tstrSocketConnectMsg *)pvMsg;

    switch (u8Msg)
    {
        case SOCKET_MSG_CONNECT:
            if (pstrConnect && pstrConnect->s8Error == SOCK_ERR_NO_ERROR)
            {
                
                // Zmiana: Pe?niejszy nag?ówek HTTP
                memset(http_request, 0, BUFFER_SIZE);
                snprintf(http_request, BUFFER_SIZE,
                        "GET /data/2.5/weather?q=%s&appid=%s&units=metric HTTP/1.1\r\n"
                        "Host: %s\r\n"
                        "User-Agent: PIC32Client\r\n"
                        "Connection: close\r\n"
                        "Accept: */*\r\n\r\n",
                        CITY_NAME, WEATHER_API_KEY, WEATHER_SERVER_NAME);
                
                send(tcp_client_socket, http_request, strlen(http_request), 0);
            }
            else
            {
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false;
            }
            break;
            
        case SOCKET_MSG_SEND:
        {
            
            // Mówimy modu?owi: "Jestem gotowy na dane, wrzu? je do recv_buffer"
            recv(tcp_client_socket, recv_buffer, sizeof(recv_buffer), 0);
        }
        break;
        // ----------------------------------
        
        case SOCKET_MSG_RECV:
        {
            tstrSocketRecvMsg *pstrRecv = (tstrSocketRecvMsg *)pvMsg;

            // Sprawdzamy, czy odebrano dane (rozmiar > 0)
            if (pstrRecv && pstrRecv->s16BufferSize > 0)
            {
                char *pcIndxPtr;
                char *pcEndPtr;
                char *tmpPtr;
                
                // Bufory na wyniki (zainicjalizowane jako N/A na wypadek b??du)
                char city[32] = "N/A";
                char temp[16] = "N/A";
                char cond[32] = "N/A";

                // --- 1. OMIJANIE NAG?ÓWKÓW HTTP ---
                // Szukamy podwójnego znaku nowej linii, który oddziela nag?ówki od tre?ci (JSON)
                pcIndxPtr = strstr((char*)pstrRecv->pu8Buffer, "\r\n\r\n");
                
                if (pcIndxPtr) 
                {
                    pcIndxPtr += 4; // Przesuwamy wska?nik za "\r\n\r\n" -> tu zaczyna si? JSON
                }
                else 
                {
                    // Je?li nie znaleziono nag?ówków, zak?adamy, ?e ca?y bufor to dane
                    pcIndxPtr = (char*)pstrRecv->pu8Buffer; 
                }

                // --- 2. PARSOWANIE MIASTA ("name") ---
                tmpPtr = strstr(pcIndxPtr, "\"name\"");
                if (tmpPtr)
                {
                    tmpPtr = strchr(tmpPtr, ':'); // Szukamy dwukropka
                    if (tmpPtr) 
                    {
                        tmpPtr++; // Przeskakujemy dwukropek
                        if(*tmpPtr == '\"') tmpPtr++; // Przeskakujemy cudzys?ów otwieraj?cy
                        
                        pcEndPtr = strchr(tmpPtr, '\"'); // Szukamy cudzys?owu zamykaj?cego
                        if(pcEndPtr) *pcEndPtr = 0; // Wstawiamy NULL (uci?cie stringa) w miejscu ko?cowego cudzys?owu
                        
                        strncpy(city, tmpPtr, sizeof(city)-1); // Kopiujemy wynik
                    }
                }

                // --- 3. PARSOWANIE TEMPERATURY ("temp") ---
                tmpPtr = strstr(pcIndxPtr, "\"temp\"");
                if(tmpPtr)
                {
                    tmpPtr = strchr(tmpPtr, ':');
                    if(tmpPtr)
                    {
                        tmpPtr++;
                        // Temperatura to liczba, ko?czy si? przecinkiem lub klamr? zamykaj?c?
                        pcEndPtr = strpbrk(tmpPtr, ",}"); 
                        if(pcEndPtr) *pcEndPtr = 0;
                        strncpy(temp, tmpPtr, sizeof(temp)-1);
                    }
                }

                // --- 4. PARSOWANIE WARUNKÓW ("weather" -> "main") ---
                // "weather" jest tablic? obiektów, wi?c szukamy najpierw "weather", a potem "main" wewn?trz
                tmpPtr = strstr(pcIndxPtr, "\"weather\"");
                if(tmpPtr)
                {
                    tmpPtr = strstr(tmpPtr, "\"main\"");
                    if(tmpPtr)
                    {
                        tmpPtr = strchr(tmpPtr, ':');
                        if(tmpPtr)
                        {
                            tmpPtr++;
                            if(*tmpPtr == '\"') tmpPtr++;
                            pcEndPtr = strchr(tmpPtr, '\"');
                            if(pcEndPtr) *pcEndPtr = 0;
                            strncpy(cond, tmpPtr, sizeof(cond)-1);
                        }
                    }
                }

                // --- 5. WY?WIETLANIE NA EKRANIE (3 LINIE) ---
                // Upewnij si?, ?e display_buffer jest zadeklarowany w pliku (np. static char display_buffer[64];)
                
                // Linia 1: Miasto (?ó?ty)
                sprintf(display_buffer, "M: %s", city);
                TFT_Print(10, 100, display_buffer, TFT_YELLOW, TFT_BLACK, 2);

                // Linia 2: Temperatura (Bia?y)
                sprintf(display_buffer, "T: %s C", temp);
                TFT_Print(10, 140, display_buffer, TFT_WHITE, TFT_BLACK, 2);

                // Linia 3: Warunki (Cyjan)
                sprintf(display_buffer, "W: %s", cond);
                TFT_Print(10, 180, display_buffer, TFT_CYAN, TFT_BLACK, 2);

                // --- 6. ZAMKNI?CIE PO??CZENIA ---
                // Wa?ne: Zwalniamy gniazdo po odebraniu danych
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false; 
            }
            else
            {
                // Obs?uga przypadku, gdy serwer zamkn?? po??czenie (EOF) lub b??d
                printf("Remote close\r\n");
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false;
            }
        }
        break;
    }
}