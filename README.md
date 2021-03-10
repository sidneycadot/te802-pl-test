
Basic Trenz TE802 test for all FPGA-accessible peripherals
==========================================================

This small demo shows how to access the following peripherals on the Trenz TE802 development board:

signal                            | in design
--------------------------------- | --------------------------------------------------------------------------------
5 user buttons                    | shown on LEDs 7 .. 3
2 config switches                 | shown on LEDs 2 .. 1
1 JACKSNS                         | shown on LED 0
8 user switches                   | shown on LEDs 7 .. 0 ; slide "up" to invert LED
Left PMOD                         | drives 11 .. 18 kHz on the 8 PMOD pins
Right PMOD                        | drives 21 .. 28 kHz on the 8 PMOD pins
VGA                               | shows 1920x1080 test image on VGA output, provided your monitor or TV handles it
Seven-segment display             | shows timer on the display with 0.1 second resolution
Headphone                         | alternately drives 500 Hz on the left and 1000 Hz on the right channel
Clock generator reset             | driven with 0

The table below shows the LEDs as used by the demo:

LED7 | LED6 | LED5  | LED4 | LED3   | LED2 | LED1 | LED0
---- | ---- | ----  | ---- | ------ | ---- | ---- | ----------------
Down | Up   | Right | Left | Center | Cfg3 | Cfg4 | HeadphonePresent

The eight user switches, when in their "up" position, invert the corresponding LED outputs.

Signals reachable from the FPGA
-------------------------------

Some devices on the board (Ethernet, USB, ...) connect directly to the processor (PS) side of the Zynq.

Only the following signals can be read or driven from the FPGA (PL) side of the Zynq:

signal               | direction (rel to FPGA) | signal meaning
-------------------- | ----------------------- | ---------------------------------------------------------------------
USER_BTN_*           |            in           | 0=pushed, 1=not pushed
USER_SW_*            |            in           | 0=down (towards edge of PCB), 1=up (towards center of PCB)
USER_CFG_SW_{3,4}    |            in           | 0=left (towards center of PCB), 1=right (towards edge of PCB)
JACK_SENSE           |            in           | Jack Sense : 0=headphone inserted, 1=no headphone inserted
LED                  |            out          | 0=off (dark), 1=on (red)
VGA_R, VGA_G, VRA_B  |            out          | 4-bit brightness of each color channel
VGA_HSYNC, VGA_VSYNC |            out          | 1 drives the SYNC signal high, 0 drives it to GND
SEG_C                |            out          | 0=segment off (dark), 1=segment on (red)
SEG_ANODE            |            out          | 0=digit on (red), 1=digit off (dark)
PWM_L, PWM_R         |            out          | drive headphone output (left channel and right channel)
CLK_GEN_RESET        |            out          | drives the RESETN/SYNC input of the CDCI6214RGET clock generator chip
