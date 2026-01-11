#include "weather_client.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#include "../examples/wifi_connection.h"
#include "../winc/socket/socket.h"
#include "../../ILI9341_files/tft_gfx.h"

/* ===================== KONFIG ===================== */
#define WEATHER_SERVER_NAME   "api.openweathermap.org"
#define WEATHER_SERVER_PORT   80
#define WEATHER_API_KEY       "b2cc6d9d9380482947d40baf1ccb8c54"

#define BUFFER_SIZE           4096 

/* ===================== ZMIENNE GLOBALNE ===================== */
static SOCKET tcp_client_socket = -1;
static uint32_t weather_server_ip = 0;
static bool server_resolved = false;
static bool connection_ready = false;

static char http_request[512];
static uint8_t recv_buffer[BUFFER_SIZE];
static uint16_t g_recv_offset = 0;

static char display_buffer[64];
static char selected_city[32] = "Krakow";
static char last_weather_info[512] = "Brak danych pogodowych.";

/* ===================== PROTOTYPY ===================== */
static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg);
static void resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP);

void weather_client_init(void) { }

void weather_set_city(const char* new_city) {
    strncpy(selected_city, new_city, sizeof(selected_city) - 1);
}

void weather_client_task(void)
{
    if (wifi_connected && !connection_ready && tcp_client_socket == -1)
    {
        registerSocketCallback(socket_cb, resolve_cb);
        gethostbyname((const char *)WEATHER_SERVER_NAME);
        connection_ready = true;
    }
}

void weather_client_reset(void) {
    if (tcp_client_socket != -1) {
        close(tcp_client_socket);
        tcp_client_socket = -1;
    }
    connection_ready = false;
    server_resolved = false;
    g_recv_offset = 0;
}

void weather_get_last_data(char* buffer) {
    strncpy(buffer, last_weather_info, 511);
    buffer[511] = '\0';
}

static void resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP)
{
    if (u32ServerIP != 0)
    {
        weather_server_ip = u32ServerIP;
        server_resolved = true;
        
        tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0);
        if (tcp_client_socket < 0) { connection_ready = false; return; }

        struct sockaddr_in addr;
        addr.sin_family = AF_INET;
        addr.sin_port = _htons(WEATHER_SERVER_PORT);
        addr.sin_addr.s_addr = weather_server_ip;

        if (connect(tcp_client_socket, (struct sockaddr *)&addr, sizeof(addr)) != SOCK_ERR_NO_ERROR) {
            connection_ready = false;
        }
    }
    else { connection_ready = false; }
}

static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg)
{
    tstrSocketConnectMsg *pstrConnect = (tstrSocketConnectMsg *)pvMsg;

    switch (u8Msg)
    {
        case SOCKET_MSG_CONNECT:
            if (pstrConnect && pstrConnect->s8Error == SOCK_ERR_NO_ERROR)
            {
                g_recv_offset = 0;
                memset(recv_buffer, 0, BUFFER_SIZE);

                memset(http_request, 0, sizeof(http_request));
                snprintf(http_request, sizeof(http_request),
                        "GET /data/2.5/forecast?q=%s&appid=%s&units=metric&cnt=8 HTTP/1.1\r\n"
                        "Host: %s\r\n"
                        "User-Agent: PIC32Client\r\n"
                        "Connection: close\r\n"
                        "Accept: */*\r\n\r\n",
                        selected_city, WEATHER_API_KEY, WEATHER_SERVER_NAME);
                
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
            recv(tcp_client_socket, recv_buffer, sizeof(recv_buffer), 0);
            break;
        
        case SOCKET_MSG_RECV:
        {
            tstrSocketRecvMsg *pstrRecv = (tstrSocketRecvMsg *)pvMsg;

            if (pstrRecv && pstrRecv->s16BufferSize > 0)
            {
                g_recv_offset += pstrRecv->s16BufferSize;
                
                if (g_recv_offset >= BUFFER_SIZE) g_recv_offset = BUFFER_SIZE - 1;
                recv_buffer[g_recv_offset] = '\0';

                int count = 0;
                char* p = (char*)recv_buffer;
                while((p = strstr(p, "\"dt_txt\"")) != NULL) {
                    count++;
                    p++;
                }

                if (count < 8) {
                    recv(tcp_client_socket, recv_buffer + g_recv_offset, BUFFER_SIZE - g_recv_offset, 0);
                    return;
                }
                
                char *pcIndxPtr = strstr((char*)recv_buffer, "\r\n\r\n");
                if (pcIndxPtr) pcIndxPtr += 4;
                else pcIndxPtr = (char*)recv_buffer; 

                sprintf(last_weather_info, "Miasto: %s\nGodz  |  Temp   | Warunki\n----------------------------------\n", selected_city);

                char *searchPtr = pcIndxPtr;
                char temp[16], cond[32], timeStr[8];
                char *tmpPtr, *pcEndPtr;

                for (int i = 0; i < 8; i++) {
                    strcpy(temp, "--"); strcpy(cond, "--"); strcpy(timeStr, "??:??");

                    // A. Temperatura
                    tmpPtr = strstr(searchPtr, "\"temp\"");
                    if (!tmpPtr) break; 
                    tmpPtr = strchr(tmpPtr, ':');
                    if(tmpPtr) {
                        tmpPtr++;
                        pcEndPtr = strpbrk(tmpPtr, ",}");
                        if(pcEndPtr) {
                            *pcEndPtr = 0;
                            strncpy(temp, tmpPtr, 15);
                            *pcEndPtr = ','; 
                        }
                    }

                    // B. Pogoda
                    char* weatherSec = strstr(tmpPtr, "\"weather\"");
                    if (weatherSec) {
                         char* mainDesc = strstr(weatherSec, "\"main\":");
                         if (mainDesc) {
                             mainDesc = strchr(mainDesc, ':');
                             if(mainDesc) {
                                 mainDesc++; 
                                 if(*mainDesc == '\"') mainDesc++; 
                                 pcEndPtr = strchr(mainDesc, '\"'); 
                                 if(pcEndPtr) {
                                     *pcEndPtr = 0;
                                     strncpy(cond, mainDesc, 31);
                                     *pcEndPtr = '\"';
                                     tmpPtr = pcEndPtr; 
                                 }
                             }
                         }
                    }

                    // C. Czas
                    char* dtTag = strstr(tmpPtr, "\"dt_txt\"");
                    if (dtTag) {
                        char* spacePtr = strchr(dtTag, ' ');
                        if (spacePtr) {
                            strncpy(timeStr, spacePtr + 1, 5);
                            timeStr[5] = '\0';
                        }
                        searchPtr = dtTag + 10; 
                    } else {
                        searchPtr = tmpPtr + 20; 
                    }

                    // EKRAN
                    if (i == 0) {
                        sprintf(display_buffer, "M: %s", selected_city);
                        TFT_Print(10, 100, display_buffer, TFT_YELLOW, TFT_BLACK, 2);
                        sprintf(display_buffer, "T: %s C", temp);
                        TFT_Print(10, 140, display_buffer, TFT_WHITE, TFT_BLACK, 2);
                        sprintf(display_buffer, "W: %s", cond);
                        TFT_Print(10, 180, display_buffer, TFT_CYAN, TFT_BLACK, 2);
                    }

                    // MAIL
                    char lineBuffer[64];
                    sprintf(lineBuffer, "%s | %-6s C | %s\n", timeStr, temp, cond);
                    if (strlen(last_weather_info) + strlen(lineBuffer) < 511) {
                        strcat(last_weather_info, lineBuffer);
                    }
                }
                
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false; 
            }
            else
            {
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false;
            }
        }
        break;
    }
}