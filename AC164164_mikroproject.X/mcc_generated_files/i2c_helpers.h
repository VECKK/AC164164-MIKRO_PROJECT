#ifndef I2C_HELPERS_H
#define I2C_HELPERS_H

#include <stdint.h>
#include <stdbool.h>

// Funkcje blokuj?ce do ?atwiejszej obs?ugi I2C
bool I2C1_WriteNBytes(uint8_t address, uint8_t* data, uint8_t length);
bool I2C1_ReadNBytes(uint8_t address, uint8_t* data, uint8_t length);

#endif