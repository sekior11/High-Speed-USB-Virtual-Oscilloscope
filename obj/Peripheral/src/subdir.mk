################################################################################
# MRS Version: 2.4.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_adc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_bkp.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_can.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_crc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dac.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dbgmcu.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dma.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dvp.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_eth.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_exti.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_flash.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_fsmc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_gpio.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_i2c.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_iwdg.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_misc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_opa.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_pwr.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rcc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rng.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rtc.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_sdio.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_spi.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_tim.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_usart.c \
e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_wwdg.c 

C_DEPS += \
./Peripheral/src/ch32v30x_adc.d \
./Peripheral/src/ch32v30x_bkp.d \
./Peripheral/src/ch32v30x_can.d \
./Peripheral/src/ch32v30x_crc.d \
./Peripheral/src/ch32v30x_dac.d \
./Peripheral/src/ch32v30x_dbgmcu.d \
./Peripheral/src/ch32v30x_dma.d \
./Peripheral/src/ch32v30x_dvp.d \
./Peripheral/src/ch32v30x_eth.d \
./Peripheral/src/ch32v30x_exti.d \
./Peripheral/src/ch32v30x_flash.d \
./Peripheral/src/ch32v30x_fsmc.d \
./Peripheral/src/ch32v30x_gpio.d \
./Peripheral/src/ch32v30x_i2c.d \
./Peripheral/src/ch32v30x_iwdg.d \
./Peripheral/src/ch32v30x_misc.d \
./Peripheral/src/ch32v30x_opa.d \
./Peripheral/src/ch32v30x_pwr.d \
./Peripheral/src/ch32v30x_rcc.d \
./Peripheral/src/ch32v30x_rng.d \
./Peripheral/src/ch32v30x_rtc.d \
./Peripheral/src/ch32v30x_sdio.d \
./Peripheral/src/ch32v30x_spi.d \
./Peripheral/src/ch32v30x_tim.d \
./Peripheral/src/ch32v30x_usart.d \
./Peripheral/src/ch32v30x_wwdg.d 

OBJS += \
./Peripheral/src/ch32v30x_adc.o \
./Peripheral/src/ch32v30x_bkp.o \
./Peripheral/src/ch32v30x_can.o \
./Peripheral/src/ch32v30x_crc.o \
./Peripheral/src/ch32v30x_dac.o \
./Peripheral/src/ch32v30x_dbgmcu.o \
./Peripheral/src/ch32v30x_dma.o \
./Peripheral/src/ch32v30x_dvp.o \
./Peripheral/src/ch32v30x_eth.o \
./Peripheral/src/ch32v30x_exti.o \
./Peripheral/src/ch32v30x_flash.o \
./Peripheral/src/ch32v30x_fsmc.o \
./Peripheral/src/ch32v30x_gpio.o \
./Peripheral/src/ch32v30x_i2c.o \
./Peripheral/src/ch32v30x_iwdg.o \
./Peripheral/src/ch32v30x_misc.o \
./Peripheral/src/ch32v30x_opa.o \
./Peripheral/src/ch32v30x_pwr.o \
./Peripheral/src/ch32v30x_rcc.o \
./Peripheral/src/ch32v30x_rng.o \
./Peripheral/src/ch32v30x_rtc.o \
./Peripheral/src/ch32v30x_sdio.o \
./Peripheral/src/ch32v30x_spi.o \
./Peripheral/src/ch32v30x_tim.o \
./Peripheral/src/ch32v30x_usart.o \
./Peripheral/src/ch32v30x_wwdg.o 

DIR_OBJS += \
./Peripheral/src/*.o \

DIR_DEPS += \
./Peripheral/src/*.d \

DIR_EXPANDS += \
./Peripheral/src/*.234r.expand \


# Each subdirectory must supply rules for building sources it contributes
Peripheral/src/ch32v30x_adc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_adc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_bkp.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_bkp.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_can.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_can.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_crc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_crc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_dac.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dac.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_dbgmcu.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dbgmcu.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_dma.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dma.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_dvp.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_dvp.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_eth.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_eth.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_exti.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_exti.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_flash.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_flash.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_fsmc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_fsmc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_gpio.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_gpio.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_i2c.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_i2c.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_iwdg.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_iwdg.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_misc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_misc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_opa.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_opa.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_pwr.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_pwr.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_rcc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rcc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_rng.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rng.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_rtc.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_rtc.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_sdio.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_sdio.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_spi.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_spi.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_tim.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_tim.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_usart.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_usart.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
Peripheral/src/ch32v30x_wwdg.o: e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/src/ch32v30x_wwdg.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

