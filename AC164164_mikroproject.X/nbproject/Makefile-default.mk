#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=ILI9341_files/glcdfont.c ILI9341_files/tft_gfx.c ILI9341_files/touch_sensor.c ILI9341_files/keypad.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/examples/wifi_connection.c mcc_generated_files/examples/weather_client.c mcc_generated_files/examples/city_menu.c mcc_generated_files/examples/email_client.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/delay.c mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/spi1_driver.c mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/spi2.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/ILI9341_files/glcdfont.o ${OBJECTDIR}/ILI9341_files/tft_gfx.o ${OBJECTDIR}/ILI9341_files/touch_sensor.o ${OBJECTDIR}/ILI9341_files/keypad.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o ${OBJECTDIR}/mcc_generated_files/examples/email_client.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/spi2.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/ILI9341_files/glcdfont.o.d ${OBJECTDIR}/ILI9341_files/tft_gfx.o.d ${OBJECTDIR}/ILI9341_files/touch_sensor.o.d ${OBJECTDIR}/ILI9341_files/keypad.o.d ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o.d ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o.d ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o.d ${OBJECTDIR}/mcc_generated_files/examples/email_client.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d ${OBJECTDIR}/mcc_generated_files/delay.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/spi2.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/ILI9341_files/glcdfont.o ${OBJECTDIR}/ILI9341_files/tft_gfx.o ${OBJECTDIR}/ILI9341_files/touch_sensor.o ${OBJECTDIR}/ILI9341_files/keypad.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o ${OBJECTDIR}/mcc_generated_files/examples/email_client.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/spi2.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=ILI9341_files/glcdfont.c ILI9341_files/tft_gfx.c ILI9341_files/touch_sensor.c ILI9341_files/keypad.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/examples/wifi_connection.c mcc_generated_files/examples/weather_client.c mcc_generated_files/examples/city_menu.c mcc_generated_files/examples/email_client.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/delay.c mcc_generated_files/pin_manager.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/spi1_driver.c mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c mcc_generated_files/spi2.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GA705
MP_LINKER_FILE_OPTION=,--script=p24FJ128GA705.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/glcdfont.o: ILI9341_files/glcdfont.c  .generated_files/flags/default/3a00927bbe9c3adbed7b61960f5f9e4f4aadb8b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/glcdfont.o: ILI9341_files/glcdfont.c  .generated_files/flags/default/2e401ffb510f1b4e4fdb827e9184e4cf356af287 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/glcdfont.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/glcdfont.c  -o ${OBJECTDIR}/ILI9341_files/glcdfont.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/glcdfont.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/tft_gfx.o: ILI9341_files/tft_gfx.c  .generated_files/flags/default/dcc63cd4ae1d2ed2a659acc2365b45d15c0e19bc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/tft_gfx.o: ILI9341_files/tft_gfx.c  .generated_files/flags/default/d0054bf7bb7b20dd96a793026f8cdedf4124ff7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/tft_gfx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/tft_gfx.c  -o ${OBJECTDIR}/ILI9341_files/tft_gfx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/tft_gfx.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/touch_sensor.o: ILI9341_files/touch_sensor.c  .generated_files/flags/default/f02551d9ffdf587f2a168877ca23826ddb0979a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/touch_sensor.o: ILI9341_files/touch_sensor.c  .generated_files/flags/default/6cbeeeeb1b66b4562f2588acd51016e6e046311 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/touch_sensor.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/touch_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/touch_sensor.c  -o ${OBJECTDIR}/ILI9341_files/touch_sensor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/touch_sensor.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/keypad.o: ILI9341_files/keypad.c  .generated_files/flags/default/f4eca669d5ce9209e721a9b84750d5419f13d7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/keypad.o: ILI9341_files/keypad.c  .generated_files/flags/default/cd42ccf5cee618d8607ee3fefe557863f752f4d9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/keypad.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/keypad.c  -o ${OBJECTDIR}/ILI9341_files/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/keypad.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/808f98278c9a736c78d2e2f8ee05cec3ceb20ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/d684c773a67807355119d3990e50023f012e9cba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o: mcc_generated_files/examples/wifi_connection.c  .generated_files/flags/default/1c8d6b4ecee31709d079e1fa349f47d4076e50cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o: mcc_generated_files/examples/wifi_connection.c  .generated_files/flags/default/4bf663ded328afb1bddd1af10e2bbee87d0b7a86 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/wifi_connection.c  -o ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/weather_client.o: mcc_generated_files/examples/weather_client.c  .generated_files/flags/default/76a8a72075eca98681c981fe42b840a638bc4c5c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/weather_client.o: mcc_generated_files/examples/weather_client.c  .generated_files/flags/default/b82f7e34859d747b62b6e5ae3a6e3da1fb5b7a8c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/weather_client.c  -o ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/weather_client.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/city_menu.o: mcc_generated_files/examples/city_menu.c  .generated_files/flags/default/fce42059be11ebc26e16b8ffd96f65d4c4369384 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/city_menu.o: mcc_generated_files/examples/city_menu.c  .generated_files/flags/default/412b6b3530d77c1e29eeacda758a2d3920493294 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/city_menu.c  -o ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/city_menu.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/email_client.o: mcc_generated_files/examples/email_client.c  .generated_files/flags/default/9998ecb050f0e5cd306979aad5a2d00311da2fd5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/email_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/email_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/email_client.c  -o ${OBJECTDIR}/mcc_generated_files/examples/email_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/email_client.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/45177806bec6bbceeaa6341036914d9ea7b05d8c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/d10c492ff9ed2910f86f8266e73986c9365b8497 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/e30abc9ccf7a1e1b52891c8593f2ae4fe6914724 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/78d9078361c7f1a06b2077b513e9e6bed43b33ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/6413c2b4008d169c42fff20187aa30070eedf6c3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/107fde58fc91d608eefd6dc975b532b266e0ba8f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/4478fbe7a2e1d63c86fbccd86eb86581dfbfa033 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/374bae7cf705a7d16b4228131ca548f12ef07025 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/cc387d02117c4cf5ffa14b3a7db2f3978bb1b1a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/586658c44ce7850fc8794ab4b705fdd6823c9016 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/ca5cf1b037a79114ffb287fa889223fde74d23d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/6849942bb406ba510c818e7d20ae90967578069e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/62f63f41fbb61b6bcb814e28d081fbc7d4f2a491 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/9d3a66de63fb2b7398005f6965904ee95a29e90e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/db3e6646379ad049bf0ac0690fc17b07b258417d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/f44ce97ae361fd212a279395c465928b82d316d5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/43beac647da6a00816a9556a3e3037a224e790dc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/4d6c59881ba763220bb9513559a28cc698db871d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/cf001f48e039964f3dc62463908e48babbce5d8a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/6f9254bff49587a21a13b832bf48a9974fc07c4a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/da35b86831a60a1bf1365ab582ada2b2c26bb34f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/c68d01028bf5d895cb4de61b650e0047a5a1e417 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/3e4fb1c767a47a2c76e42585852ec7971c3cf204 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/b27191934d755476d843dde23f46a1416cc580c2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/d49f82bd36fed9474eaa188f608f5611e47c4cbd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/651f3484a61e06520fe09d3418bb2e679dddbc5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/987649abe388d6feab4c8a888fb523202b102c6d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/2be4f2af380242802b13c20546862a467768573f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/a68a7b77fd1a010a92f36837d8bdda3787b05cce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/6262354dc217e595c6948ed680122a33c095b6b7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/57841b748c7a250d54f3e98f45037edf7e84266a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/2aaf098cbebb50a8a4f4b2549983ff24f264c300 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/352c6638b3e9a3eb50bad50167731cff5f009d14 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/2fbc91e98c423ad86fe83d441b09d67278674992 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/c90263ee66a26db6e71bbad06558cec82496813 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/19a5dc6597106769f6afe832bfb64f918279fda .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/d58f9b4e714fffb5b2fe35e3630333eb958e8e05 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/645186deaf4b40ec07382b56251482e9e360a668 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/a959e1ad5b44e720bdd042d72c668ec574a9b3e3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/13a0773ab4f059c483fc025605af3abfa09d8734 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/b93d8609b3a31eed957c665924b284e240c89aa2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/285358e03797bd022d4f7e496dd1dca2329bbb33 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/be33a2d9b0e966d1f067796803f2d63ea5219de5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/733f4ff20733d0bccbf38185f692106fc89494d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/spi2.o: mcc_generated_files/spi2.c  .generated_files/flags/default/b5cdbcfdb8bd5d4c7b7a45a85cac6ce3d42f6666 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/spi2.o: mcc_generated_files/spi2.c  .generated_files/flags/default/3c2fd710562eb8fe720dcb51eb23485664b9ae7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi2.c  -o ${OBJECTDIR}/mcc_generated_files/spi2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/37f46c0b6a0f77392015c0b5b28efb43007afd8d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/a7ce431ec0dfdde59ae9383205c16e95da0d289e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/glcdfont.o: ILI9341_files/glcdfont.c  .generated_files/flags/default/754d6ab829b8a7c990b2f4ca23041b4ff9ec995c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/glcdfont.o: ILI9341_files/glcdfont.c  .generated_files/flags/default/cdab17c4032aacffe3a2fb17ad06e6703e8f8657 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/glcdfont.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/glcdfont.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/glcdfont.c  -o ${OBJECTDIR}/ILI9341_files/glcdfont.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/glcdfont.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/tft_gfx.o: ILI9341_files/tft_gfx.c  .generated_files/flags/default/fdc8c10bb67d42ea233e48cbc4456388c2ab9c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/tft_gfx.o: ILI9341_files/tft_gfx.c  .generated_files/flags/default/2ea43a99f2857472596c874bcc3269caaf11dc1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/tft_gfx.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/tft_gfx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/tft_gfx.c  -o ${OBJECTDIR}/ILI9341_files/tft_gfx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/tft_gfx.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/touch_sensor.o: ILI9341_files/touch_sensor.c  .generated_files/flags/default/31f847f957beb5a0211b70b1d147ef45ee764310 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/touch_sensor.o: ILI9341_files/touch_sensor.c  .generated_files/flags/default/b4cb017058c99e0075c2cff7cf330a3e4997c35a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/touch_sensor.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/touch_sensor.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/touch_sensor.c  -o ${OBJECTDIR}/ILI9341_files/touch_sensor.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/touch_sensor.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/ILI9341_files/keypad.o: ILI9341_files/keypad.c  .generated_files/flags/default/56f2c757adf96d251b50a6b5845b8bc753bd57db .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/ILI9341_files/keypad.o: ILI9341_files/keypad.c  .generated_files/flags/default/4fd4b4e81040cd89b1522520470feeda33b4b2b6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/ILI9341_files" 
	@${RM} ${OBJECTDIR}/ILI9341_files/keypad.o.d 
	@${RM} ${OBJECTDIR}/ILI9341_files/keypad.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ILI9341_files/keypad.c  -o ${OBJECTDIR}/ILI9341_files/keypad.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ILI9341_files/keypad.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/9b35a11fa8989ef928a618fdd8a4897bd3d8cbd7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/c750a5a665ce133f51d1b617390d8ae81c7f3a11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o: mcc_generated_files/examples/wifi_connection.c  .generated_files/flags/default/ed38e922dd0e13b61331bc7d71cafbebb19e6ad4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o: mcc_generated_files/examples/wifi_connection.c  .generated_files/flags/default/924a66aea6f80e514ee3e13125d3acf01ac5c6f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/wifi_connection.c  -o ${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/wifi_connection.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/weather_client.o: mcc_generated_files/examples/weather_client.c  .generated_files/flags/default/a2b7b45c40d9b179cce66de3ef279ad307ea4839 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/weather_client.o: mcc_generated_files/examples/weather_client.c  .generated_files/flags/default/90616ff79688a63ea28eb5d27e0516aa327d1f87 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/weather_client.c  -o ${OBJECTDIR}/mcc_generated_files/examples/weather_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/weather_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/city_menu.o: mcc_generated_files/examples/city_menu.c  .generated_files/flags/default/9b31d9131359ed7414721064822dd91ef7ab61ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/examples/city_menu.o: mcc_generated_files/examples/city_menu.c  .generated_files/flags/default/513358288be301ab07934658c77f9e313a92c042 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/city_menu.c  -o ${OBJECTDIR}/mcc_generated_files/examples/city_menu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/city_menu.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/examples/email_client.o: mcc_generated_files/examples/email_client.c  .generated_files/flags/default/76c4d02ea08fd6bb8b38d3f41268d1fcb37982b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/email_client.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/email_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/email_client.c  -o ${OBJECTDIR}/mcc_generated_files/examples/email_client.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/email_client.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/913b0c5c17c7ad60e8ad21d545aacb3580913a51 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/ad2a0e9f1b0ee94bf422a01e9514721ff86612da .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/7ed1c6d82e287abb83167104015cc4ac593803ce .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/e0c60baf33eff62ff911474978ac62e7c92dfce9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/54dfe6ada809523cac11d33b69094b32a0abd542 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/9451f85d1b37f1039cf22d26e3a300a62544259e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/7a8b9c98323c80869ce1184c78f9d91f4e0876cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/625ab6e41dde0474368d8b7ec778068f32c4e8de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/82e9932abd76dd42a49642ef2ea50c6cff07df0e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/2b9eb1e7529d80ff65692304cdc6663820321bb7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/82e0c9b103f44882c27bee7a8c4a812513148feb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/ce978e3b3d58fd309b1a8ddf13ee363601990d21 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/b0cfd8fe175815c876e9bc4e3c341d07c0eeb245 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/a114c659f1814a214880a77a1199d744dea2aadd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/8bac8fe3c2a92ce5f35ee6b43c0f323de4f5b725 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/838b31b352b1b5f68f2f9a9e02d81293890cfac1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/cb83d9747f8a09646abc43424696d8ca62ce6313 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/e86ee376d1ef97efbfb064c659b366d907a6f6be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/28ccc1e93a5c5dcce81b22b6e1378ac5de17c3cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/1351fea6749637443b665fabb1e96def1b68627b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/b97ddafd9443ed4d69fc3caee23d26b81ca2525b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/c637073ad14a71d38215e7b78c2c1aa11f602bd7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/ac034e5742dd1a2fece74aa93cc172a1ad897f58 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/a854b34666bc72efd3f938cf17ab801f4a53ab91 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/ce284bf215235dc87f8122d942390c26954d0f4f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/dbec728aed9e03cdb45ca0564817351c4ee60eaa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/2c3a7ec140e09d7653e94d656a256764b9663e8f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/c4b14472b85d363594cb8a776cee2995475dd277 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/418d3ccf2957dfb9d3a8788b68f1482b374b9107 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/4d1bdb50018ea1f70326be08cd84b02ee146d6c5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/ffbeee1cfac3f1be9f86c8da6a894da74646835e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/275c5dcbe476bbb87d3d0359aa01a87c3331e0de .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/1907d25417786aef938a6fce9977a1c9acbd347f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/15ce059bd896b125c279a6662c74df397092208 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/d51b58bd4a5ff62de0a8438c5e22281fc96745f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/3a98e7a8ee4de38c2be91f3ab0790af8dd2b95e1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/48941217ffd8d38f1e2a495a045e74fbbf046380 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/95177c03459c52ed8c303f6638cc9bd6fbdc9a9a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/c5c589c574069a1c83e29beea3836df4deeaf4a6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/3ae8213a9a51a070cda26f418817122fad7c083d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/6f4cdf5e1515bea1bd4330cb81c7c9baf203dd11 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/4312d03a0e8a652d34da51f8d2e1b07282a627f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/163e88a5251c12228c8e4440e195f85e1af6027e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/9208a3e4476a882dd815b74ee47caf5b85e353cf .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/spi2.o: mcc_generated_files/spi2.c  .generated_files/flags/default/ff95888f03f14c27b613ede44fdc06f7bb2b9013 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/spi2.o: mcc_generated_files/spi2.c  .generated_files/flags/default/dc3ca47d41f55e7dfcb3bae2223756e9f9ee59ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi2.c  -o ${OBJECTDIR}/mcc_generated_files/spi2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
<<<<<<< HEAD
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/55ffd4ad92c949b76a7f62aa7e67535e11c40225 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/3f8e03db9a84c469d557d4ecdeb1726751b339d0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/9cae47df6b7810a3573244f38707d3ca2e05331f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/c04d3ff020353b2174332f4f7033db6e2b6acab9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
<<<<<<< HEAD
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/bcc0a3c020da329e05582c4f5134b3011f026393 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
=======
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/3edf865faa9f9c6e859d4595898768ac7857e167 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
>>>>>>> Select_city
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers"  -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
