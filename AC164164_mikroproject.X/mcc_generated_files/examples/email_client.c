#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include "../examples/email_client.h"
#include "../winc/socket/socket.h"
#include "../../ILI9341_files/tft_gfx.h"

// --- KONFIGURACJA GMAIL ---
#define SMTP_SERVER         "smtp.gmail.com"
#define SMTP_PORT           465 // Port SSL
#define SMTP_USERNAME_BASE64 "dTMzNTk3NjU0ODJAZ21haWwuY29t" 
#define SMTP_PASSWORD_BASE64 "aXd4bW5kYmJ4emdydW16bg=="
#define SENDER_EMAIL        "u3359765482@gmail.com"

typedef enum {
    EMAIL_IDLE,
    EMAIL_RESOLVE,
    EMAIL_CONNECTING,
    EMAIL_WAIT_GREETING,
    EMAIL_SEND_EHLO,
    EMAIL_SEND_AUTH_LOGIN,
    EMAIL_SEND_USER,
    EMAIL_SEND_PASS,
    EMAIL_SEND_MAIL_FROM,
    EMAIL_SEND_RCPT_TO,
    EMAIL_SEND_DATA_CMD,
    EMAIL_SEND_CONTENT,
    EMAIL_SEND_QUIT,
    EMAIL_DONE
} EmailState;

static SOCKET email_socket = -1;
static EmailState state = EMAIL_IDLE;
static uint32_t server_ip = 0;
static char send_buffer[1024];
static uint8_t recv_buffer[256];

static char target_email[64];
static char email_body[512];

// Prototypy
static void email_socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg);
static void email_resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP);

void email_client_init(void) {
    state = EMAIL_IDLE;
}

bool email_is_busy(void) {
    return (state != EMAIL_IDLE);
}

void email_send_start(char* to, char* subject, char* body) {
    if (state != EMAIL_IDLE) return;
    
    strncpy(target_email, to, sizeof(target_email) - 1);
    target_email[sizeof(target_email) - 1] = '\0';
    
    strncpy(email_body, body, sizeof(email_body) - 1);
    email_body[sizeof(email_body) - 1] = '\0';
    
    TFT_FillRect(10, 260, 200, 20, TFT_BLACK);
    TFT_Print(10, 260, "Wysylanie email...", TFT_YELLOW, TFT_BLACK, 1);
    
    state = EMAIL_RESOLVE;
}

void email_client_task(void) {
    switch (state) {
        case EMAIL_RESOLVE:
            registerSocketCallback(email_socket_cb, email_resolve_cb);
            gethostbyname((uint8_t*)SMTP_SERVER);
            state = EMAIL_CONNECTING;
            break;
            
        case EMAIL_DONE:
            if (email_socket >= 0) {
                close(email_socket);
                email_socket = -1;
            }
            TFT_FillRect(10, 260, 200, 20, TFT_BLACK);
            TFT_Print(10, 260, "Email wyslany!", TFT_GREEN, TFT_BLACK, 2);
            state = EMAIL_IDLE;
            break;
            
        default:
            
            break;
    }
}

// --- CALLBACKI ---

static void email_resolve_cb(uint8_t *pu8DomainName, uint32_t u32ServerIP) {
    if (u32ServerIP != 0) {
        server_ip = u32ServerIP;
        
        email_socket = socket(AF_INET, SOCK_STREAM, 1);
        
        if (email_socket >= 0) {
            struct sockaddr_in addr;
            addr.sin_family = AF_INET;
            addr.sin_port = _htons(SMTP_PORT);
            addr.sin_addr.s_addr = server_ip;
            connect(email_socket, (struct sockaddr *)&addr, sizeof(addr));
        }
    } else {
        state = EMAIL_IDLE;
        TFT_Print(10, 260, "Blad DNS Email", TFT_RED, TFT_BLACK, 1);
    }
}

static void send_cmd(char* cmd) {
    send(email_socket, (uint8_t*)cmd, strlen(cmd), 0);
}

static void email_socket_cb(SOCKET sock, uint8_t u8Msg, void *pvMsg) {
    if (sock != email_socket) return;

    switch (u8Msg) {
        case SOCKET_MSG_CONNECT:
        {
            tstrSocketConnectMsg *pstrConnect = (tstrSocketConnectMsg *)pvMsg;
            if (pstrConnect && pstrConnect->s8Error == 0) {
                state = EMAIL_WAIT_GREETING;
                recv(email_socket, recv_buffer, sizeof(recv_buffer), 0);
            } else {
                close(email_socket);
                email_socket = -1;
                state = EMAIL_IDLE;
                TFT_Print(10, 260, "Blad polaczenia Email", TFT_RED, TFT_BLACK, 1);
            }
        }
        break;

        case SOCKET_MSG_RECV:
        {
            tstrSocketRecvMsg *pstrRecv = (tstrSocketRecvMsg *)pvMsg;
            if (pstrRecv && pstrRecv->s16BufferSize > 0) {
                
                switch(state) {
                    case EMAIL_WAIT_GREETING:
                        sprintf(send_buffer, "EHLO pic32\r\n");
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_AUTH_LOGIN;
                        break;
                        
                    case EMAIL_SEND_AUTH_LOGIN:
                        sprintf(send_buffer, "AUTH LOGIN\r\n");
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_USER;
                        break;
                        
                    case EMAIL_SEND_USER:
                        sprintf(send_buffer, "%s\r\n", SMTP_USERNAME_BASE64);
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_PASS;
                        break;
                        
                    case EMAIL_SEND_PASS:
                        sprintf(send_buffer, "%s\r\n", SMTP_PASSWORD_BASE64);
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_MAIL_FROM;
                        break;
                        
                    case EMAIL_SEND_MAIL_FROM:
                        sprintf(send_buffer, "MAIL FROM: <%s>\r\n", SENDER_EMAIL);
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_RCPT_TO;
                        break;
                        
                    case EMAIL_SEND_RCPT_TO:
                        sprintf(send_buffer, "RCPT TO: <%s>\r\n", target_email);
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_DATA_CMD;
                        break;
                        
                    case EMAIL_SEND_DATA_CMD:
                        sprintf(send_buffer, "DATA\r\n");
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_CONTENT;
                        break;
                        
                    case EMAIL_SEND_CONTENT:
                        sprintf(send_buffer, 
                            "From: %s\r\n"
                            "To: %s\r\n"
                            "Subject: Pogoda z PIC32\r\n"
                            "\r\n"
                            "Prognoza pogody\r\n%s\r\n"
                            ".\r\n",
                            SENDER_EMAIL, target_email, email_body);
                        send_cmd(send_buffer);
                        state = EMAIL_SEND_QUIT;
                        break;
                        
                    case EMAIL_SEND_QUIT:
                        sprintf(send_buffer, "QUIT\r\n");
                        send_cmd(send_buffer);
                        state = EMAIL_DONE;
                        break;
                        
                    default:
                        break;
                }
                
                if (state != EMAIL_DONE) {
                    recv(email_socket, recv_buffer, sizeof(recv_buffer), 0);
                }
                else {
                    close(email_socket);
                    email_socket = -1;
                    state = EMAIL_IDLE;
                }
            }
        }
        break;
    }
}
