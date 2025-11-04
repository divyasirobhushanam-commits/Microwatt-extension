# Makefile for custom test in Microwatt

CROSS_COMPILE ?= powerpc64le-linux-gnu-
CC := $(CROSS_COMPILE)gcc
LD := $(CROSS_COMPILE)ld

CFLAGS := -Os -g -Wall -std=c99 -nostdinc -msoft-float -mno-string -mno-multiple \
          -mno-vsx -mno-altivec -mlittle-endian -fno-stack-protector -mstrict-align \
          -ffreestanding -fdata-sections -ffunction-sections -I ../../include \
          -isystem /usr/lib/gcc-cross/powerpc64le-linux-gnu/11/include

OBJS = custom.o head.o potato_uart.o ../../lib/console.o

all: custom.elf

custom.o: custom.c
	$(CC) $(CFLAGS) -c -o $@ $<

head.o: head.S
	$(CC) $(CFLAGS) -c -o $@ $<

custom.elf: $(OBJS)
	$(LD) -T powerpc.lds -o $@ $(OBJS)

clean:
	rm -f *.o *.elf *.bin *.hex


