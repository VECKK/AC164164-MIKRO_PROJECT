#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/i2c1_driver.h"
#include "i2c_helpers.h"

static void I2C1_Wait(void) {
    i2c1_waitForEvent(NULL); 
    i2c1_clearIRQ();     
}

bool I2C1_WriteNBytes(uint8_t address, uint8_t* data, uint8_t length) {
    i2c1_driver_start();
    I2C1_Wait();

    i2c1_driver_TXData(address << 1); 
    I2C1_Wait();
    
    if (i2c1_driver_isNACK()) {
        i2c1_driver_stop();
        I2C1_Wait();
        return false;
    }

    for (uint8_t i = 0; i < length; i++) {
        i2c1_driver_TXData(data[i]);
        I2C1_Wait();
        
        if (i2c1_driver_isNACK()) {
            i2c1_driver_stop();
            I2C1_Wait();
            return false; 
        }
    }

    i2c1_driver_stop();
    I2C1_Wait();
    return true;
}

bool I2C1_ReadNBytes(uint8_t address, uint8_t* data, uint8_t length) {
    i2c1_driver_start();
    I2C1_Wait();

    i2c1_driver_TXData((address << 1) | 1);
    I2C1_Wait();

    if (i2c1_driver_isNACK()) {
        i2c1_driver_stop();
        I2C1_Wait();
        return false;
    }

    for (uint8_t i = 0; i < length; i++) {
        i2c1_driver_startRX(); 
        I2C1_Wait();
        
        data[i] = i2c1_driver_getRXData();

        if (i < (length - 1)) {
            i2c1_driver_sendACK(); 
        } else {
            i2c1_driver_sendNACK(); 
        }
        I2C1_Wait();
    }

    i2c1_driver_stop();
    I2C1_Wait();
    return true;
}