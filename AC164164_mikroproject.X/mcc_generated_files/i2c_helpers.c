#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/i2c1_driver.h"
#include "i2c_helpers.h"

// Pomocnicza funkcja czekaj?ca na zako?czenie operacji (polling flagi przerwania)
static void I2C1_Wait(void) {
    i2c1_waitForEvent(NULL); // Czeka na ustawienie flagi MI2C1IF
    i2c1_clearIRQ();         // Czy?ci flag? po operacji
}

bool I2C1_WriteNBytes(uint8_t address, uint8_t* data, uint8_t length) {
    // 1. Start
    i2c1_driver_start();
    I2C1_Wait();

    // 2. Adres (Write)
    i2c1_driver_TXData(address << 1); // Przesuni?cie adresu (7-bit -> 8-bit)
    I2C1_Wait();
    
    if (i2c1_driver_isNACK()) {
        i2c1_driver_stop();
        I2C1_Wait();
        return false; // B??d: brak urz?dzenia
    }

    // 3. Dane
    for (uint8_t i = 0; i < length; i++) {
        i2c1_driver_TXData(data[i]);
        I2C1_Wait();
        
        if (i2c1_driver_isNACK()) {
            i2c1_driver_stop();
            I2C1_Wait();
            return false; // B??d transmisji
        }
    }

    // 4. Stop
    i2c1_driver_stop();
    I2C1_Wait();
    return true;
}

bool I2C1_ReadNBytes(uint8_t address, uint8_t* data, uint8_t length) {
    // 1. Start
    i2c1_driver_start();
    I2C1_Wait();

    // 2. Adres (Read) - ustawienie bitu R/W na 1
    i2c1_driver_TXData((address << 1) | 1);
    I2C1_Wait();

    if (i2c1_driver_isNACK()) {
        i2c1_driver_stop();
        I2C1_Wait();
        return false;
    }

    // 3. Odbiór danych
    for (uint8_t i = 0; i < length; i++) {
        i2c1_driver_startRX(); // W??cz odbiornik
        I2C1_Wait();
        
        data[i] = i2c1_driver_getRXData();

        if (i < (length - 1)) {
            i2c1_driver_sendACK(); // ACK dla ka?dego bajtu oprócz ostatniego
        } else {
            i2c1_driver_sendNACK(); // NACK na koniec
        }
        I2C1_Wait();
    }

    // 4. Stop
    i2c1_driver_stop();
    I2C1_Wait();
    return true;
}