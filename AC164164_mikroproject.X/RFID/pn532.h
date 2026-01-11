#ifndef PN532_H
#define PN532_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
    uint8_t uid[7];
    uint8_t uidLen;
} PN532_Tag;

bool PN532_Init(void);

bool PN532_ReadPassiveTargetID(PN532_Tag *tagWskaznik);

#endif // PN532_H