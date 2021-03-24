
Basic Trenz TE802 test for all FPGA-accessible peripherals
==========================================================

This small demo shows how to access the following peripherals on the Trenz TE802 development board:

signal                            | in design
--------------------------------- | -----------------------------------------------------------------------------------
5 user buttons                    | shown on LEDs 7…3
2 config switches                 | shown on LEDs 2…1
1 JACK SENSE                      | shown on LED 0
8 user switches                   | shown on LEDs 7…0 ; slide "up" to invert LED
Left PMOD                         | drives 11…18 kHz on the 8 PMOD pins
Right PMOD                        | drives 21…28 kHz on the 8 PMOD pins
VGA                               | shows 1920×1080 test image on VGA output, provided your monitor or TV can handle it
Seven-segment display             | shows timer on the display with 0.1 second resolution
Headphone                         | alternately drives 200 Hz on the left channel and 400 Hz on the right channel
Clock generator reset             | driven with 1 (no reset)

The table below shows the LEDs as used by the demo:

LED7 | LED6 | LED5  | LED4 | LED3   | LED2    | LED1    | LED0
---- | ---- | ----- | ---- | ------ | ------- | ------- | ----------
Down | Up   | Right | Left | Center | CfgSw-3 | CfgSw-4 | Jack Sense

The eight user switches, when in their "up" position, invert the corresponding LED outputs.

Note that the "Center" user button is also used to reset the counter on the seven-segment display.

Signals reachable from the FPGA
-------------------------------

Some devices on the board (Ethernet, USB, ...) connect directly to the processor (PS) side of the Zynq.

Only the following signals can be read or driven from the FPGA (PL) side of the Zynq:

signal               | direction (relative to FPGA) | signal meaning
-------------------- | ---------------------------- | ---------------------------------------------------------------------
USER_BTN_*           |            in                | 0=pushed, 1=not pushed
USER_SW_*            |            in                | 0=down (towards edge of PCB), 1=up (towards center of PCB)
USER_CFG_SW_{3,4}    |            in                | 0=left (towards center of PCB), 1=right (towards edge of PCB)
JACK_SENSE           |            in                | Jack Sense : 0=headphone detected, 1=no headphone detected
LED                  |            out               | 0=off (dark), 1=on (red)
VGA_R, VGA_G, VGA_B  |            out               | 4-bit brightness of each color channel
VGA_HSYNC, VGA_VSYNC |            out               | 1 drives the SYNC signal high, 0 drives it to GND
SEG_C                |            out               | 0=segment off (dark), 1=segment on (red)
SEG_ANODE            |            out               | 0=digit on (red), 1=digit off (dark)
PWM_L, PWM_R         |            out               | drive headphone output (left channel and right channel)
CLK_GEN_RESET        |            out               | drives the RESETN/SYNC input of the CDCI6214RGET clock generator chip

How to get this working
-----------------------

1. Start Vivado and select "Create Project".

2. Enter a project name, for example "te802-test".

3. Select "RTL project". Deselect "Do not specify sources at this time", because we want to do just that.

4. When you get to Add Sources, select the 7 files ending in ".vhdl": toplevel.vhdl, clocksynth.vhdl,
   synchronizer.vhdl, frequency_maker.vhdl, seven_segment_display.vhdl, seven_segment_counter.vhdl, and vga.vhdl.

5. When you get to "Add Constraints", add "constraints.xdc".

6. At "Default Part", select the "xczu2cg-sbva484-1-e". It may be convenient to set some filters to find to part:
   Family to "Zynq UltraScale+ MPSoCs", Package to "sbva484", Speed to "-1", and Temperature to "E".

7. Vivado now creates and opens the project. Unfortunately, all files now have type "VHDL" where they should be
   "VHDL 2008", because we use some newer syntax.

   Unfortunately, there seems to be no other way to fix this than other than by selecting each of the 7 files in the
   "Sources" pane one by one, and then change the "Type" field as shown in the "Source File Properties" pane for each
   of the files. If someone knows a better way, let me know!

8. Now you are ready to generate the bitfile. Just hit "Generate Bitstream". This is not a big design, but it will
   still take several minutes to compile.

9. To upload the generated bitfile, connect your TE802 board to your computer via USB, select "Open Hardware Manager",
   "Open Target", and perform "Auto Connect". The Zynq chip should now show up as "zczu2_0" or something very similar,
   in the "Hardware pane". Right-click it, select "Program Device…", and then select the "toplevel.bit" file just
   created. The design should upload to the FPGA which takes a few seconds, and then start to run immediately.

10. Hook up a modern VGA screen to admire the beautiful test pattern generated by the FPGA, or marvel as the seconds
    tick away on the four-digit seven-segment display. Hook up a headphone to enjoy 200 Hz on your left ear and
    400 Hz on your right ear — that's right, *STEREO* baby!

    If you don't hear different signals on your left and right ears, play around with the jack for a bit —
    I found it works best if it's not jammed in fully.

    After this immersive multi-media experience, press some buttons or move some switches to experience the visceral
    pleasure of lighting up LEDs.

With this design as a starting point, the world of FPGAs is yours to conquer!
