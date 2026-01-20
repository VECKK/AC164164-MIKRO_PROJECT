#include "pn532.h"
#include <string.h>
#include "../mcc_generated_files/mcc.h"
#include "../mcc_generated_files/i2c1_driver.h"

#define PN532_I2C_ADDR        (0x48 >> 1) 
#define PN532_PREAMBLE        0x00
#define PN532_STARTCODE1      0x00
#define PN532_STARTCODE2      0xFF
#define PN532_HOSTTOPN532     0xD4
#define PN532_PN532TOHOST     0xD5

#define FCY 16000000UL
#include <libpic30.h>

static void I2C_Wait(void) {
    i2c1_waitForEvent(NULL);
    i2c1_clearIRQ();
}

static bool I2C_WriteBytes(uint8_t addr, uint8_t* data, uint8_t len) {
    i2c1_driver_start();
    I2C_Wait();

    i2c1_driver_TXData(addr << 1);
    I2C_Wait();
    if (i2c1_driver_isNACK()) { i2c1_driver_stop(); I2C_Wait(); return false; }

    for (uint8_t i = 0; i < len; i++) {
        i2c1_driver_TXData(data[i]);
        I2C_Wait();
        if (i2c1_driver_isNACK()) { i2c1_driver_stop(); I2C_Wait(); return false; }
    }

    i2c1_driver_stop();
    I2C_Wait();
    return true;
}

static bool I2C_ReadBytes(uint8_t addr, uint8_t* data, uint8_t len) {
    i2c1_driver_start();
    I2C_Wait();

    i2c1_driver_TXData((addr << 1) | 1);
    I2C_Wait();
    if (i2c1_driver_isNACK()) { i2c1_driver_stop(); I2C_Wait(); return false; }

    for (uint8_t i = 0; i < len; i++) {
        i2c1_driver_startRX();
        I2C_Wait();
        data[i] = i2c1_driver_getRXData();

        if (i < len - 1) {
            i2c1_driver_sendACK();
        } else {
            i2c1_driver_sendNACK();
        }
        I2C_Wait();
    }

    i2c1_driver_stop();
    I2C_Wait();
    return true;
}

static bool PN532_IsReady(void) {
    uint8_t status = 0;
    i2c1_driver_start();
    I2C_Wait();
    
    i2c1_driver_TXData((PN532_I2C_ADDR << 1) | 1); 
    I2C_Wait();
    
    if (i2c1_driver_isNACK()) { 
        i2c1_driver_stop(); 
        I2C_Wait(); 
        return false; 
    }

    i2c1_driver_startRX();
    I2C_Wait();
    status = i2c1_driver_getRXData();
    i2c1_driver_sendNACK();
    I2C_Wait();
    
    i2c1_driver_stop();
    I2C_Wait();

    return (status == 0x01);
}

static void PN532_WriteCommand(uint8_t* cmd, uint8_t cmdlen) {
    uint8_t buff[64];
    uint8_t checksum = 0;
    int i = 0;

    buff[i++] = PN532_PREAMBLE;
    buff[i++] = PN532_STARTCODE1;
    buff[i++] = PN532_STARTCODE2;
    buff[i++] = cmdlen + 1; 
    buff[i++] = ~((uint8_t)(cmdlen + 1)) + 1; 
    buff[i++] = PN532_HOSTTOPN532;
    checksum += PN532_HOSTTOPN532;

    for (int k = 0; k < cmdlen; k++) {
        buff[i++] = cmd[k];
        checksum += cmd[k];
    }

    buff[i++] = ~checksum + 1;
    buff[i++] = 0x00; 

    I2C_WriteBytes(PN532_I2C_ADDR, buff, i);
}

static bool PN532_ReadResponse(uint8_t* buffer, uint8_t maxLen) {
    int timeout = 200; 
    while (!PN532_IsReady()) {
        __delay_ms(1);
        if (--timeout == 0) return false;
    }
    return I2C_ReadBytes(PN532_I2C_ADDR, buffer, maxLen);
}

bool PN532_Init(void) {
    uint8_t cmd[] = { 0x14, 0x01, 0x14, 0x01 };
    PN532_WriteCommand(cmd, sizeof(cmd));
    
    __delay_ms(20);
    
    uint8_t ackBuff[6];
    if (PN532_ReadResponse(ackBuff, 6)) {
        return true;
    }
    return false;
}

bool PN532_ReadPassiveTargetID(PN532_Tag *tagWskaznik) {
    uint8_t cmd[] = { 0x4A, 0x01, 0x00 };
    PN532_WriteCommand(cmd, sizeof(cmd));

    __delay_ms(2); 
    uint8_t ackBuff[8];
    if (!PN532_ReadResponse(ackBuff, 6)) {
        return false; 
    }
    
    uint8_t response[32];
    if (PN532_ReadResponse(response, 24)) {
        for (int i = 0; i < 18; i++) {
            if (response[i] == PN532_PN532TOHOST && response[i+1] == (cmd[0] + 1)) {
                if (response[i+2] == 1) {
                    tagWskaznik->uidLen = response[i+7];
                    if (tagWskaznik->uidLen > 7) tagWskaznik->uidLen = 7;
                    for (int k = 0; k < tagWskaznik->uidLen; k++) {
                        tagWskaznik->uid[k] = response[i+8+k];
                    }
                    return true;
                }
            }
        }
    }
    return false;
}
