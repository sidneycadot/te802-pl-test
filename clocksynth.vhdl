library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

entity clocksynth is
    port (
        CLK_25MHz : in  std_logic;
        CLK_MAIN  : out std_logic;
        CLK_VGA   : out std_logic
    );
end entity clocksynth;


architecture arch of clocksynth is

signal MMCM1_feedback_clock : std_logic;
signal MMCM2_feedback_clock : std_logic;

begin

    MMCME1 : MMCME4_BASE
    generic map (
        BANDWIDTH       => "OPTIMIZED", -- Jitter programming
        CLKFBOUT_MULT_F => 37.125,      -- Multiply value for all CLKOUT
        DIVCLK_DIVIDE   => 1,           -- Master division value
        --
        CLKFBOUT_PHASE => 0.0,          -- Phase offset in degrees of CLKFB
        CLKIN1_PERIOD => 1000.0 / 25.0, -- Input clock period in ns.
        --
        CLKOUT0_DIVIDE_F => 6.25,   -- Divide amount for CLKOUT0
        CLKOUT1_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT2_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT3_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT4_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT5_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT6_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        --
        CLKOUT0_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT0
        CLKOUT1_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT2_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT3_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT4_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT5_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT6_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        --
        CLKOUT0_PHASE => 0.0,       -- Phase offset for CLKOUT0
        CLKOUT1_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT2_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT3_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT4_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT5_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT6_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        --
        CLKOUT4_CASCADE => "FALSE", -- Divide amount for CLKOUT (1-128)
        IS_CLKFBIN_INVERTED => '0', -- Optional inversion for CLKFBIN
        IS_CLKIN1_INVERTED => '0',  -- Optional inversion for CLKIN1
        IS_PWRDWN_INVERTED => '0',  -- Optional inversion for PWRDWN
        IS_RST_INVERTED => '0',     -- Optional inversion for RST
        REF_JITTER1 => 0.0,         -- Reference input jitter in UI (0.000-0.999).
        STARTUP_WAIT => "TRUE"      -- Delays DONE until MMCM is locked
    )
    port map (
        CLKIN1    => CLK_25MHz, -- 1-bit input: Primary clock
        --
        CLKOUT0   => CLK_VGA,  -- 1-bit output: CLKOUT0
        CLKOUT1   => open,     -- 1-bit output: CLKOUT1
        CLKOUT2   => open,     -- 1-bit output: CLKOUT2
        CLKOUT3   => open,     -- 1-bit output: CLKOUT3
        CLKOUT4   => open,     -- 1-bit output: CLKOUT4
        CLKOUT5   => open,     -- 1-bit output: CLKOUT5
        CLKOUT6   => open,     -- 1-bit output: CLKOUT6
        --
        CLKOUT0B  => open,   -- 1-bit output: Inverted CLKOUT0
        CLKOUT1B  => open,   -- 1-bit output: Inverted CLKOUT1
        CLKOUT2B  => open,   -- 1-bit output: Inverted CLKOUT2
        CLKOUT3B  => open,   -- 1-bit output: Inverted CLKOUT3
        --
        CLKFBOUT  => MMCM1_feedback_clock, -- 1-bit output: Feedback clock pin to the MMCM
        CLKFBOUTB => open,                 -- 1-bit output: Inverted CLKFBOUT
        CLKFBIN   => MMCM1_feedback_clock, -- 1-bit input: Feedback clock pin to the MMCM
        --
        LOCKED    => open,            -- 1-bit output: LOCK
        PWRDWN    => '0',             -- 1-bit input: Power-down
        --
        RST       => '0'              -- 1-bit input: Reset
    );

    MMCME2 : MMCME4_BASE
    generic map (
        BANDWIDTH       => "OPTIMIZED", -- Jitter programming
        CLKFBOUT_MULT_F => 48.00,       -- Multiply value for all CLKOUT
        DIVCLK_DIVIDE   => 1,           -- Master division value
        --
        CLKFBOUT_PHASE => 0.0,          -- Phase offset in degrees of CLKFB
        CLKIN1_PERIOD => 1000.0 / 25.0, -- Input clock period in ns.
        --
        CLKOUT0_DIVIDE_F => 6.0,    -- Divide amount for CLKOUT0
        CLKOUT1_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT2_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT3_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT4_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT5_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        CLKOUT6_DIVIDE => 1,        -- Divide amount for CLKOUT (1-128)
        --
        CLKOUT0_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT0
        CLKOUT1_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT2_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT3_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT4_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT5_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        CLKOUT6_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
        --
        CLKOUT0_PHASE => 0.0,       -- Phase offset for CLKOUT0
        CLKOUT1_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT2_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT3_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT4_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT5_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        CLKOUT6_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
        --
        CLKOUT4_CASCADE => "FALSE", -- Divide amount for CLKOUT (1-128)
        IS_CLKFBIN_INVERTED => '0', -- Optional inversion for CLKFBIN
        IS_CLKIN1_INVERTED => '0',  -- Optional inversion for CLKIN1
        IS_PWRDWN_INVERTED => '0',  -- Optional inversion for PWRDWN
        IS_RST_INVERTED => '0',     -- Optional inversion for RST
        REF_JITTER1 => 0.0,         -- Reference input jitter in UI (0.000-0.999).
        STARTUP_WAIT => "TRUE"      -- Delays DONE until MMCM is locked
    )
    port map (
        CLKIN1    => CLK_25MHz, -- 1-bit input: Primary clock
        --
        CLKOUT0   => CLK_MAIN, -- 1-bit output: CLKOUT0
        CLKOUT1   => open,     -- 1-bit output: CLKOUT1
        CLKOUT2   => open,     -- 1-bit output: CLKOUT2
        CLKOUT3   => open,     -- 1-bit output: CLKOUT3
        CLKOUT4   => open,     -- 1-bit output: CLKOUT4
        CLKOUT5   => open,     -- 1-bit output: CLKOUT5
        CLKOUT6   => open,     -- 1-bit output: CLKOUT6
        --
        CLKOUT0B  => open,   -- 1-bit output: Inverted CLKOUT0
        CLKOUT1B  => open,   -- 1-bit output: Inverted CLKOUT1
        CLKOUT2B  => open,   -- 1-bit output: Inverted CLKOUT2
        CLKOUT3B  => open,   -- 1-bit output: Inverted CLKOUT3
        --
        CLKFBOUT  => MMCM2_feedback_clock, -- 1-bit output: Feedback clock pin to the MMCM
        CLKFBOUTB => open,                 -- 1-bit output: Inverted CLKFBOUT
        CLKFBIN   => MMCM2_feedback_clock, -- 1-bit input: Feedback clock pin to the MMCM
        --
        LOCKED    => open,            -- 1-bit output: LOCK
        PWRDWN    => '0',             -- 1-bit input: Power-down
        --
        RST       => '0'              -- 1-bit input: Reset
   );

end architecture arch;
