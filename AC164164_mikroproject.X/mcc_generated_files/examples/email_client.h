#ifndef EMAIL_CLIENT_H
#define EMAIL_CLIENT_H

#include <stdbool.h>

void email_client_init(void);

void email_send_start(char* to_email, char* subject, char* body);
void email_client_task(void);

bool email_is_busy(void);

#endif
