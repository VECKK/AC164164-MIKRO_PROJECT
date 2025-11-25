#include "../examples/weather_client.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

#include "../examples/wifi_connection.h"
#include "../winc/socket/socket.h"

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

/* ===================== PROTOTYPY ===================== */
static void socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg);
static void resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP);
void weather_client_init(void);
void weather_client_task(void);

/**
 * Initialization of the weather client
 */
void weather_client_init(void)
{
    printf("[WEATHER] Init weather client...\r\n");
}

void weather_client_task(void)
{
    /* Uruchom tylko je?li Wi-Fi po??czone i jeszcze nie po??czono z serwerem */
    if (wifi_connected && !connection_ready)
    {
        printf("[WEATHER] Resolving server %s...\r\n", WEATHER_SERVER_NAME);
        registerSocketCallback(socket_cb, resolve_cb);
        gethostbyname((const char *)WEATHER_SERVER_NAME);
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

        printf("[WEATHER] Server IP: %u.%u.%u.%u\n",
               (uint8_t)(u32ServerIP >> 24),
               (uint8_t)(u32ServerIP >> 16),
               (uint8_t)(u32ServerIP >> 8),
               (uint8_t)(u32ServerIP));

        /* Open socket TCP */
        tcp_client_socket = socket(AF_INET, SOCK_STREAM, 0);
        if (tcp_client_socket < 0)
        {
            printf("[WEATHER] Socket creation error!\r\n");
            return;
        }

        struct sockaddr_in addr;
        addr.sin_family = AF_INET;
        addr.sin_port = _htons(WEATHER_SERVER_PORT);
        addr.sin_addr.s_addr = weather_server_ip;

        if (connect(tcp_client_socket, (struct sockaddr *)&addr, sizeof(addr)) != SOCK_ERR_NO_ERROR)
        {
            printf("[WEATHER] TCP connection error!\r\n");
        }
    }
    else
    {
        printf("[WEATHER] DNS resolution failed.\r\n");
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
                printf("[WEATHER] Connected to the weather server!\r\n");
                connection_ready = true;
                
                snprintf(http_request, BUFFER_SIZE,
                        "GET /data/2.5/weather?q=%s&appid=%s HTTP/1.1\r\nHost: %s\r\n\r\n",
                        CITY_NAME, WEATHER_API_KEY, WEATHER_SERVER_NAME);
                send(tcp_client_socket, http_request, strlen(http_request), 0);
            }
            else
            {
                printf("[WEATHER] Connection failed!\r\n");
            }
            break;
        
        case SOCKET_MSG_RECV:
        {
            char *pcIndxPtr;
            char *pcEndPtr;
            tstrSocketRecvMsg *pstrRecv = (tstrSocketRecvMsg *)pvMsg;

            if (pstrRecv && pstrRecv->s16BufferSize > 0)
            {
                printf("[WEATHER] RAW DATA:\r\n%s\r\n", pstrRecv->pu8Buffer);

                pcIndxPtr = strstr((char*)pstrRecv->pu8Buffer, "\r\n\r\n");
                if (pcIndxPtr) pcIndxPtr += 4;

                char city[32] = "N/A";
                char temp[16] = "N/A";
                char cond[32] = "N/A";

                char *tmpPtr = strstr(pcIndxPtr, "\"name\"");
                if (tmpPtr)
                {
                    tmpPtr = strchr(tmpPtr, ':');
                    if (tmpPtr) 
                    {
                        tmpPtr++;
                        if(*tmpPtr=='\"') tmpPtr++;
                        pcEndPtr = strchr(tmpPtr,'\"');
                        if(pcEndPtr) *pcEndPtr = 0;
                        strncpy(city, tmpPtr, sizeof(city)-1);
                    }
                }

                tmpPtr = strstr(pcIndxPtr, "\"temp\"");
                if(tmpPtr)
                {
                    tmpPtr = strchr(tmpPtr, ':');
                    if(tmpPtr)
                    {
                        tmpPtr++;
                        pcEndPtr = strpbrk(tmpPtr, ",}");
                        if(pcEndPtr) *pcEndPtr = 0;
                        strncpy(temp, tmpPtr, sizeof(temp)-1);
                    }
                }

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
                            if(*tmpPtr=='\"') tmpPtr++;
                            pcEndPtr = strchr(tmpPtr,'\"');
                            if(pcEndPtr) *pcEndPtr = 0;
                            strncpy(cond, tmpPtr, sizeof(cond)-1);
                        }
                    }
                }

                printf("City: %s\r\nTemperature: %s C\r\nCondition: %s\r\n",
                    city, temp, cond);

                // zamkni?cie socketu
                close(tcp_client_socket);
                tcp_client_socket = -1;
                connection_ready = false;
            }
        }
        break;
    }
}
