# These were gobbled from a Trenz distributed project.
# Note: USER_BTN_* pins were defined twice.

# Enable bitstream compression.
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

set_property -dict {PACKAGE_PIN J3 IOSTANDARD LVCMOS18} [get_ports CLK_PL]

# Left PMOD connector (J6)
# Can be used as inputs or eitputs (individually).
#
# +-----------------------------------+
# | VCC | GND | p4  | p3  | p2  | p1  |
# +-----------------------------------+   Looking from the outside into the connector.
# | VCC | GND | p10 | p9  | p8  | p7  |   VCC = 3.3V.
# +-----------------------------------+

set_property -dict {PACKAGE_PIN D8 IOSTANDARD LVCMOS33} [get_ports PMOD1_p1]
set_property -dict {PACKAGE_PIN E8 IOSTANDARD LVCMOS33} [get_ports PMOD1_p2]
set_property -dict {PACKAGE_PIN D6 IOSTANDARD LVCMOS33} [get_ports PMOD1_p3]
set_property -dict {PACKAGE_PIN D7 IOSTANDARD LVCMOS33} [get_ports PMOD1_p4]
set_property -dict {PACKAGE_PIN F6 IOSTANDARD LVCMOS33} [get_ports PMOD1_p7]
set_property -dict {PACKAGE_PIN G7 IOSTANDARD LVCMOS33} [get_ports PMOD1_p8]
set_property -dict {PACKAGE_PIN C5 IOSTANDARD LVCMOS33} [get_ports PMOD1_p9]
set_property -dict {PACKAGE_PIN D5 IOSTANDARD LVCMOS33} [get_ports PMOD1_p10]

# Right PMOD connector (J5)
# Can be used as inputs or eitputs (individually).
#
# +-----------------------------------+
# | VCC | GND | p4  | p3  | p2  | p1  |
# +-----------------------------------+   Looking from the outside into the connector.
# | VCC | GND | p10 | p9  | p8  | p7  |   VCC = 3.3V.
# +-----------------------------------+

set_property -dict {PACKAGE_PIN F8 IOSTANDARD LVCMOS33} [get_ports PMOD2_p1]
set_property -dict {PACKAGE_PIN F7 IOSTANDARD LVCMOS33} [get_ports PMOD2_p2]
set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports PMOD2_p3]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports PMOD2_p4]
set_property -dict {PACKAGE_PIN G6 IOSTANDARD LVCMOS33} [get_ports PMOD2_p7]
set_property -dict {PACKAGE_PIN G5 IOSTANDARD LVCMOS33} [get_ports PMOD2_p8]
set_property -dict {PACKAGE_PIN C8 IOSTANDARD LVCMOS33} [get_ports PMOD2_p9]
set_property -dict {PACKAGE_PIN C7 IOSTANDARD LVCMOS33} [get_ports PMOD2_p10]

# User button inputs (0=pushed, 1=not pushed):

set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS18} [get_ports USER_BTN_DOWN  ]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS18} [get_ports USER_BTN_UP    ]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS18} [get_ports USER_BTN_RIGHT ]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS18} [get_ports USER_BTN_LEFT  ]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS18} [get_ports USER_BTN_CENTER]

# User switch inputs (0=slide-down, 1=slide-up)

set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS18} [get_ports {USER_SW[0]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS18} [get_ports {USER_SW[1]}]
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS18} [get_ports {USER_SW[2]}]
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS18} [get_ports {USER_SW[3]}]
set_property -dict {PACKAGE_PIN K1 IOSTANDARD LVCMOS18} [get_ports {USER_SW[4]}]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS18} [get_ports {USER_SW[5]}]
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS18} [get_ports {USER_SW[6]}]
set_property -dict {PACKAGE_PIN M5 IOSTANDARD LVCMOS18} [get_ports {USER_SW[7]}]

# Red LED outputs (0=off, 1=on):

set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS18} [get_ports {LED[0]}]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS18} [get_ports {LED[1]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS18} [get_ports {LED[2]}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS18} [get_ports {LED[3]}]
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS18} [get_ports {LED[4]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS18} [get_ports {LED[5]}]
set_property -dict {PACKAGE_PIN L4 IOSTANDARD LVCMOS18} [get_ports {LED[6]}]
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS18} [get_ports {LED[7]}]

# VGA output.
# Note: R/G/B signals are driven at 1.8V; VSYNC and HSYNC are driven at 3.3V.

set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS18} [get_ports {VGA_R[0]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS18} [get_ports {VGA_R[1]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS18} [get_ports {VGA_R[2]}]
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS18} [get_ports {VGA_R[3]}]

set_property -dict {PACKAGE_PIN C2 IOSTANDARD LVCMOS18} [get_ports {VGA_G[0]}]
set_property -dict {PACKAGE_PIN D2 IOSTANDARD LVCMOS18} [get_ports {VGA_G[1]}]
set_property -dict {PACKAGE_PIN D1 IOSTANDARD LVCMOS18} [get_ports {VGA_G[2]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS18} [get_ports {VGA_G[3]}]

set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS18} [get_ports {VGA_B[0]}]
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS18} [get_ports {VGA_B[1]}]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS18} [get_ports {VGA_B[2]}]
set_property -dict {PACKAGE_PIN B1 IOSTANDARD LVCMOS18} [get_ports {VGA_B[3]}]

set_property -dict {PACKAGE_PIN B7 IOSTANDARD LVCMOS33} [get_ports VGA_VSYNC]
set_property -dict {PACKAGE_PIN A6 IOSTANDARD LVCMOS33} [get_ports VGA_HSYNC]

# Seven-segment display

set_property -dict {PACKAGE_PIN E4 IOSTANDARD LVCMOS18} [get_ports {SEG_C[0]}]
set_property -dict {PACKAGE_PIN D3 IOSTANDARD LVCMOS18} [get_ports {SEG_C[1]}]
set_property -dict {PACKAGE_PIN N5 IOSTANDARD LVCMOS18} [get_ports {SEG_C[2]}]
set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS18} [get_ports {SEG_C[3]}]
set_property -dict {PACKAGE_PIN N4 IOSTANDARD LVCMOS18} [get_ports {SEG_C[4]}]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS18} [get_ports {SEG_C[5]}]
set_property -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS18} [get_ports {SEG_C[6]}]
set_property -dict {PACKAGE_PIN N3 IOSTANDARD LVCMOS18} [get_ports {SEG_C[7]}]

set_property -dict {PACKAGE_PIN A8 IOSTANDARD LVCMOS33} [get_ports {SEG_AN[0]}]
set_property -dict {PACKAGE_PIN A9 IOSTANDARD LVCMOS33} [get_ports {SEG_AN[1]}]
set_property -dict {PACKAGE_PIN B9 IOSTANDARD LVCMOS33} [get_ports {SEG_AN[2]}]
set_property -dict {PACKAGE_PIN A7 IOSTANDARD LVCMOS33} [get_ports {SEG_AN[3]}]
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {SEG_AN[4]}]

# These are 2 of 4 dip-switch settings on the small dip switch block next to the VGA port.
# Sliding them to the side of the PCB edge makes them read as '1'.

set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS18} [get_ports USER_CFG_SW_3]
set_property -dict {PACKAGE_PIN B4 IOSTANDARD LVCMOS18} [get_ports USER_CFG_SW_4]

# Headphone output,  PWM, left and right.
# (Left/right doesn't seem to work on my headphone?)

set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS18} [get_ports PWM_L]
set_property -dict {PACKAGE_PIN F4 IOSTANDARD LVCMOS18} [get_ports PWM_R]

# Headset jack inserted detection (0==detected, 1==not detected).
set_property -dict {PACKAGE_PIN F3 IOSTANDARD LVCMOS18} [get_ports JACKSNS]

# Define the 25 MHz CLK_PL clock.
create_clock -period 40.0 -name CLK_PL_clock -add [get_ports CLK_PL]

# Drives the RESETN/SYNC input of the CDCI6214RGET device on the TE802 PCB.
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS33} [get_ports CLK_GEN_RESET]
