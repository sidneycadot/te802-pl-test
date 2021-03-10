
Basic Trenz TE802 test for all FPGA-accessible peripherals
==========================================================

This small demo shows how to access the following peripherals on the Trenz TE802 development board:

* 5 user buttons ............. : shown on the LEDs.
* 8 user switches ............ : shown on the LEDs (invert the signal).
* 2 config switches .......... : shown on the LED.
* 1 JACKSNS .................. : shows presence or absence of a headphone on LED.
* Left PMOD .................. : drives 11 .. 18 kHz on the 8 PMOD pins.
* Right PMOD ................. : drives 21 .. 28 kHz on the 8 PMOD pins.
* VGA ........................ : Drives 1920x1080 test image on VGA (out of spec, but modern monitors will display it).
* Seven-segment display ...... : shows timer on the display with 0.1 second resolution.
* Headphone .................. : Alternately drives 55 Hz on the left, and 1760 Hz on the right channel.
* Clock generator reset ...... : Driven with 0.

The table below shows the LED display (LED7 on the left, LED0 on the right):

+--------------------------------------------------------------------+
| Down | Up | Right | Left | Center | Cfg3 | Cfg4 | HeadphonePresent |
+------+----+-------+------+--------+------+------+------------------+

The eight user switches, when in their "up" position, invert the corresponding LED outputs.

Signals reachable from the FPGA
-------------------------------

Some devices on the board (Ethernet, USB, ...) connect directly to the processor inside the Zynq.

Only the following signals can be read or driven from the PL (FPGA) side of the Zynq:

+----------------------+-------------------------+---------------------------------------------------------------+
| signal               | direction (rel to FPGA) | signal meaning                                                |
+----------------------+-------------------------+---------------------------------------------------------------+
| USER_BTN_*           |            in           | 0=pushed, 1=not pushed                                        |        
| USER_SW_*            |            in           | 0=down (towards edge of PCB), 1=up (towards center of PCB)    |
| USER_CFG_SW_{3,4}    |            in           | 0=left (towards center of PCB), 1=right (towards edge of PCB) |
| JACKSNS              |            in           | Jack Sense : 0=headphone inserted, 1=no headphone inserted    |
| LED                  |            out          | 0=off (dark), 1=on (red)                                      |
| VGA_R, VGA_G, VRA_B  |            out          | 1 makes the output of that channel brighter                   |
| VGA_HSYNC, VGA_VSYNC |            out          | 1 drives the SYNC signal high, 0 drives it to GND             |
| SEG_C                |            out          | 0=segment off (dark), 1=segment on (red)                      |
| SEG_ANODE            |            out          | 0=digit on (red), 1=digit off (dark)                          |
| PWM_L, PWM_R         |            out          | drive headphone output (left channel and right channel)       |
| CLK_GEN_RESET        |            out          | drives the RESETN/SYNC input of the CDCI6214RGET chip         |
+----------------------+-------------------------+---------------------------------------------------------------+
