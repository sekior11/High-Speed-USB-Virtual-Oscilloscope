################################################################################
# MRS Version: 2.4.0
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../User/adc.c \
../User/ch32v30x_it.c \
../User/ch32v30x_usbhs_device.c \
../User/dma.c \
../User/main.c \
../User/system_ch32v30x.c \
../User/usb_desc.c 

C_DEPS += \
./User/adc.d \
./User/ch32v30x_it.d \
./User/ch32v30x_usbhs_device.d \
./User/dma.d \
./User/main.d \
./User/system_ch32v30x.d \
./User/usb_desc.d 

OBJS += \
./User/adc.o \
./User/ch32v30x_it.o \
./User/ch32v30x_usbhs_device.o \
./User/dma.o \
./User/main.o \
./User/system_ch32v30x.o \
./User/usb_desc.o 

DIR_OBJS += \
./User/*.o \

DIR_DEPS += \
./User/*.d \

DIR_EXPANDS += \
./User/*.234r.expand \


# Each subdirectory must supply rules for building sources it contributes
User/%.o: ../User/%.c
	@	riscv-none-embed-gcc -march=rv32imacxw -mabi=ilp32 -msmall-data-limit=8 -msave-restore -fmax-errors=20 -Os -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized -g -I"e:/CH32V307EVT/EVT/EXAM/SRC/Debug" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Core" -I"e:/CH32V307EVT/EVT/EXAM/USB/USBHS/DEVICE/CH372Device_test/User" -I"e:/CH32V307EVT/EVT/EXAM/SRC/Peripheral/inc" -std=gnu99 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

