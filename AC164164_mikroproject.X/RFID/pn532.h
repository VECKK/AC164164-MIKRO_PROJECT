#ifndef PN532_H
#define PN532_H

#include <stdint.h>
#include <stdbool.h>

// Struktura przechowuj?ca dane odczytanego tagu
typedef struct {
    uint8_t uid[7];
    uint8_t uidLen;
} PN532_Tag;

/**
 * @brief Inicjalizuje modu? PN532 (konfiguracja SAM i komunikacji).
 * Nale?y wywo?a? raz po starcie systemu i w??czeniu I2C.
 */
bool PN532_Init(void);

/**
 * @brief Sprawdza, czy w polu znajduje si? karta RFID.
 * * @param tagWskaznik Wska?nik do struktury, gdzie zostan? zapisane dane karty.
 * @return true Je?li wykryto kart? i poprawnie odczytano UID.
 * @return false Je?li brak karty lub b??d komunikacji.
 */
bool PN532_ReadPassiveTargetID(PN532_Tag *tagWskaznik);

#endif // PN532_H