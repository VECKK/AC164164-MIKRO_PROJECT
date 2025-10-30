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
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/delay.c mcc_generated_files/examples/winc_example.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/spi1_driver.c main.c mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/main.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/delay.o.d ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/tmr1.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/delay.o ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/tmr1.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/where_was_i.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/main.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/clock.o

# Source Files
SOURCEFILES=mcc_generated_files/delay.c mcc_generated_files/examples/winc_example.c mcc_generated_files/winc/driver/winc_adapter.c mcc_generated_files/winc/driver/winc_asic.c mcc_generated_files/winc/driver/winc_drv.c mcc_generated_files/winc/driver/winc_hif.c mcc_generated_files/winc/driver/winc_spi.c mcc_generated_files/winc/m2m/m2m_crypto.c mcc_generated_files/winc/m2m/m2m_fwinfo.c mcc_generated_files/winc/m2m/m2m_ota.c mcc_generated_files/winc/m2m/m2m_periph.c mcc_generated_files/winc/m2m/m2m_ssl.c mcc_generated_files/winc/m2m/m2m_wifi.c mcc_generated_files/winc/socket/socket.c mcc_generated_files/winc/spi_flash/flexible_flash.c mcc_generated_files/winc/spi_flash/spi_flash.c mcc_generated_files/pin_manager.c mcc_generated_files/tmr1.c mcc_generated_files/uart1.c mcc_generated_files/drivers/spi_master.c mcc_generated_files/interrupt_manager.c mcc_generated_files/traps.c mcc_generated_files/where_was_i.s mcc_generated_files/spi1_driver.c main.c mcc_generated_files/mcc.c mcc_generated_files/system.c mcc_generated_files/clock.c



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
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/f9ad7d8901526a620fe2a72345281ffb079dfd45 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/examples/winc_example.o: mcc_generated_files/examples/winc_example.c  .generated_files/flags/default/a04a69c24a8db5c15ddda831cf4ecd623d51f8cc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/winc_example.c  -o ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/winc_example.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/725665eb1ae7fbe53be8e3627fe4b034d2337ca4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/80b5ae94679ce964949b33fca7d53e0953b46238 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/da86270a2cac05c28a97293e27e14dc7796b71f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/96360655301341789bc15c3fad317e89818ce110 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/5c08ff2b7c8f97295650580bf832ef039c3cfa38 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/35d14af3fb80c553805b9c9fe5b53853b659645d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/a2d877fa183368c05ab3ed758bfa7bae774c008b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/77467af40ec00a4a5aeb310b473a06d5a2e8522 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/a112cc25ac9d6fbb6a9bfc3d0e89196f4b6d711e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/e9aa79afab2a9ca095fc9ada384f0cd1ccf4328c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/e6065a38ef139b19af4f17175c47323b98148f50 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/56ccc9f5ff7ccbf6bb3559c01a8b5a8791224fec .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/3806ff4bd54719e0c8987b276c8cad05a3fd518f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/16887d44f39a422e366544fbe6d2aa77066ff57a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/38a9eb5c82cb3e7fcf7ff8dd6d1bedd4b3caff5d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/2e3314859de2e8528bf12169db6c16b3b88b46cb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/b54a90d9beaaf7487e759e968ca662f12c093fa5 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/b53f7e84515757f875ba4c872e8e09e6e9314945 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/e3d3416e4ca2f118ed75649dd38556153fb4213a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/1458ddc1ecbd5f62d8c774347e94bb8bddad6f1b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/cdc1fb68ed3afd377e85a657274f0e96cb75a067 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/94d40c2e35f5701fdd930e0d92cd4efaafac213f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/9d5658c2cf23d853e63c06636121da077937b0d2 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/59549fbc5ed7c1e1f4339b1c684b170e6f4a037c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/ae990c9119fa466d0c195cc787cea21ff503c583 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/delay.o: mcc_generated_files/delay.c  .generated_files/flags/default/42e49084d9da9c56e1e3d45d685ef68772f1dbfc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/delay.c  -o ${OBJECTDIR}/mcc_generated_files/delay.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/delay.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/examples/winc_example.o: mcc_generated_files/examples/winc_example.c  .generated_files/flags/default/a74076f02434c7c7128148234025ad0b2d4e58f4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/examples" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/examples/winc_example.c  -o ${OBJECTDIR}/mcc_generated_files/examples/winc_example.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/examples/winc_example.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o: mcc_generated_files/winc/driver/winc_adapter.c  .generated_files/flags/default/80380a861c059cb5e066066e355d5543b8fcb103 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_adapter.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_adapter.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o: mcc_generated_files/winc/driver/winc_asic.c  .generated_files/flags/default/2d99c676cfcf2ebba77803b2773330ee2a0afd21 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_asic.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_asic.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o: mcc_generated_files/winc/driver/winc_drv.c  .generated_files/flags/default/4111f0edd292d3be28b3bd44af16d32445e3ffe6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_drv.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_drv.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o: mcc_generated_files/winc/driver/winc_hif.c  .generated_files/flags/default/5cd2d2a0a60bf549daeceafa8000ba827200417b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_hif.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_hif.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o: mcc_generated_files/winc/driver/winc_spi.c  .generated_files/flags/default/53f81969956437eb052d0027ce67d9987e146740 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/driver" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/driver/winc_spi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/driver/winc_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o: mcc_generated_files/winc/m2m/m2m_crypto.c  .generated_files/flags/default/39de7d0ca349705a9fb59e40a772ec0e5711327f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_crypto.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_crypto.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o: mcc_generated_files/winc/m2m/m2m_fwinfo.c  .generated_files/flags/default/27c87bb3adc8f4e671be0341a76d45b0c2b42df9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_fwinfo.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_fwinfo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o: mcc_generated_files/winc/m2m/m2m_ota.c  .generated_files/flags/default/1225789f7bd992b3c5e3ec6bc8ec765dfed50257 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ota.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ota.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o: mcc_generated_files/winc/m2m/m2m_periph.c  .generated_files/flags/default/eb3d5b2bfcfa702b3f548e6f11e0a2fb3ddde42c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_periph.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_periph.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o: mcc_generated_files/winc/m2m/m2m_ssl.c  .generated_files/flags/default/f7ce123f07f4dadcc2d30358391ac0e639ea06f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_ssl.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_ssl.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o: mcc_generated_files/winc/m2m/m2m_wifi.c  .generated_files/flags/default/e718a32c229407ecc13fae7f029cdfbdac210e31 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/m2m" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/m2m/m2m_wifi.c  -o ${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/m2m/m2m_wifi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o: mcc_generated_files/winc/socket/socket.c  .generated_files/flags/default/2e796bac641332a0f8ccc04b2e6afe9b2958e07b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/socket" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/socket/socket.c  -o ${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/socket/socket.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o: mcc_generated_files/winc/spi_flash/flexible_flash.c  .generated_files/flags/default/bb707f999c7caba3a173d504f506d2388f087755 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/flexible_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/flexible_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o: mcc_generated_files/winc/spi_flash/spi_flash.c  .generated_files/flags/default/78f3d7bc1df5dd8705c8080f0b87b3222274fcb4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/winc/spi_flash" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/winc/spi_flash/spi_flash.c  -o ${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/winc/spi_flash/spi_flash.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/27584818109392817254ca50e7c6a479d7d474c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/tmr1.o: mcc_generated_files/tmr1.c  .generated_files/flags/default/98328d55429cb302eaecaa848bb0750362afb556 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/tmr1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/tmr1.c  -o ${OBJECTDIR}/mcc_generated_files/tmr1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/tmr1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/51f7ce7a86ddb23a766715cc77381b0d8c106639 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/25a3b69bafe25b54413f4486f3e047773bcc6252 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/59fce6e646cf2bdd3073bbf7e0ac0805e0a94e30 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/57505e2d3766918ea84bf6130705389e75a0fcc .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/89a453173da8f9f9b9f2898bd8202f804c772f74 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e7d3a07e9e55486fc6a6f8b04375983406e880b9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/61409a0cf8e6ae0793e3307608273e380aa91231 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/ce64c4015aad2abaa9a2c1629698fd46cf9c7da9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/82b94ef2659797b03b3947fd6638298a516cb1fa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/5c2a3e74f6caacb209255eccd9816884a8fd9f83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/where_was_i.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  mcc_generated_files/where_was_i.s  -o ${OBJECTDIR}/mcc_generated_files/where_was_i.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers" -Wa,-MD,"${OBJECTDIR}/mcc_generated_files/where_was_i.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/where_was_i.o: mcc_generated_files/where_was_i.s  .generated_files/flags/default/33a81dd6fea25c4f5b3fd141ffaf29733bab1d90 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/AC164164_mikroproject.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -I"mcc_generated_files/config" -I"mcc_generated_files/winc" -I"mcc_generated_files/drivers"     -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
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
