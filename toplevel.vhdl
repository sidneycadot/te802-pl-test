
-- Basic test design for the Trenz TE802 board.

library ieee;
use ieee.std_logic_1164.all;

entity toplevel is
    port (
        CLK_PL          : in std_logic;
        --
        USER_BTN_DOWN   : in std_logic;
        USER_BTN_UP     : in std_logic;
        USER_BTN_RIGHT  : in std_logic;
        USER_BTN_LEFT   : in std_logic;
        USER_BTN_CENTER : in std_logic;
        USER_SW         : in std_logic_vector(7 downto 0);
        USER_CFG_SW_3   : in std_logic;
        USER_CFG_SW_4   : in std_logic;
        --
        PMOD1_p1  : out std_logic;
        PMOD1_p2  : out std_logic;
        PMOD1_p3  : out std_logic;
        PMOD1_p4  : out std_logic;
        PMOD1_p7  : out std_logic;
        PMOD1_p8  : out std_logic;
        PMOD1_p9  : out std_logic;
        PMOD1_p10 : out std_logic;
        --
        PMOD2_p1  : out std_logic;
        PMOD2_p2  : out std_logic;
        PMOD2_p3  : out std_logic;
        PMOD2_p4  : out std_logic;
        PMOD2_p7  : out std_logic;
        PMOD2_p8  : out std_logic;
        PMOD2_p9  : out std_logic;
        PMOD2_p10 : out std_logic;
        --
        VGA_R     : out std_logic_vector(3 downto 0);
        VGA_G     : out std_logic_vector(3 downto 0);
        VGA_B     : out std_logic_vector(3 downto 0);
        VGA_VSYNC : out std_logic;
        VGA_HSYNC : out std_logic;
        --
        LED    : out std_logic_vector(7 downto 0);
        SEG_C  : out std_logic_vector(7 downto 0);
        SEG_AN : out std_logic_vector(4 downto 0);
        --
        JACK_SENSE : in  std_logic;
        PWM_L      : out std_logic;
        PWM_R      : out std_logic;
        --
        CLK_GEN_RESET : out std_logic
    );
end entity toplevel;

architecture arch of toplevel is

signal CLK_VGA : std_logic;
signal RESET : std_logic;

-- Signals for connecting the seven-segment display to the seven-segment counter.
signal D3, D2, D1, D0 : std_logic_vector(3 downto 0);
signal D3_EN, D2_EN, D1_EN, D0_EN : std_logic;
signal D3_LDOT, D2_LDOT, D1_LDOT, D0_LDOT : std_logic;

-- Headphone signals.
signal LEFT, RIGHT, X1, X0 : std_logic;

begin

    clocksynth_instance : entity work.clocksynth
        port map (
            CLK_25MHz => CLK_PL,
            CLK_VGA   => CLK_VGA
        );

    sync_reset : entity work.synchronizer
        port map(
            SRC_ASYNC => not USER_BTN_CENTER,
            DST_CLK   => CLK_PL,
            DST_SYNC  => RESET
        );

    LED <= ((not USER_BTN_DOWN) & (not USER_BTN_UP) & (not USER_BTN_RIGHT) & (not USER_BTN_LEFT) & (not USER_BTN_CENTER) & USER_CFG_SW_3 & USER_CFG_SW_4 & (not JACK_SENSE)) xor (not USER_SW);

    -- Alternately put 55 Hz on the left channel, 1760 Hz on the right channel.
    --
    --
    -- x1 x0
    --  0  0     silence
    --  0  1     left (500 Hz)
    --  1  0     silence
    --  1  1     right (1000 Hz)

    x0_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 1.0, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => X0);
    x1_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 0.5, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => X1);

    pwm_l_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 200.0, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => LEFT);
    pwm_r_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 400.0, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => RIGHT);

    PWM_L <= LEFT  and (not X1) and X0;
    PWM_R <= RIGHT and (    X1) and X0;

    -- Put an identifying frequency on each of the PMOD outputs (you can verify with a scope).

    pmod1_p1_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 11.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p1);
    pmod1_p2_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 12.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p2);
    pmod1_p3_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 13.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p3);
    pmod1_p4_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 14.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p4);
    pmod1_p7_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 15.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p7);
    pmod1_p8_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 16.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p8);
    pmod1_p9_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 17.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p9);
    pmod1_p10_fm : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 18.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD1_p10);

    pmod2_p1_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 21.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p1);
    pmod2_p2_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 22.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p2);
    pmod2_p3_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 23.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p3);
    pmod2_p4_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 24.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p4);
    pmod2_p7_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 25.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p7);
    pmod2_p8_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 26.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p8);
    pmod2_p9_fm  : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 27.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p9);
    pmod2_p10_fm : entity work.frequency_maker generic map (num_counter_bits => 32, clk_frequency => 25.0e6, target_frequency => 28.0e3, duty_cycle => 50.0) port map(CLK => CLK_PL, RESET => '0', OUTPUT => PMOD2_p10);

    seven_segment_display_driver : entity work.seven_segment_display
        port map (
            CLK    => CLK_PL,
            --
            PORT_RESET      => RESET,
            --
            PORT_D3         => D3,
            PORT_D2         => D2,
            PORT_D1         => D1,
            PORT_D0         => D0,
            PORT_D3_EN      => D3_EN,
            PORT_D2_EN      => D2_EN,
            PORT_D1_EN      => D1_EN,
            PORT_D0_EN      => D0_EN,
            PORT_D3_LDOT    => D3_LDOT,
            PORT_D2_LDOT    => D2_LDOT,
            PORT_D1_LDOT    => D1_LDOT,
            PORT_D0_LDOT    => D0_LDOT,
            PORT_AUXDOT_HI  => '0',
            PORT_AUXDOT_MLO => '0',
            PORT_AUXDOT_MHI => '0',
            --
            PORT_SEG_C      => SEG_C,
            PORT_SEG_AN     => SEG_AN
        );

    seven_segment_counter_instance : entity work.seven_segment_counter
        port map (
            CLK          => CLK_PL,
            PORT_RESET   => RESET,
            --
            PORT_D3      => D3,
            PORT_D2      => D2,
            PORT_D1      => D1,
            PORT_D0      => D0,
            PORT_D3_EN   => D3_EN,
            PORT_D2_EN   => D2_EN,
            PORT_D1_EN   => D1_EN,
            PORT_D0_EN   => D0_EN,
            PORT_D3_LDOT => D3_LDOT,
            PORT_D2_LDOT => D2_LDOT,
            PORT_D1_LDOT => D1_LDOT,
            PORT_D0_LDOT => D0_LDOT
        );

    vga_driver : entity work.vga
        port map (
            CLK            => CLK_VGA,
            PORT_RESET     => RESET,
            PORT_VGA_R     => VGA_R,
            PORT_VGA_G     => VGA_G,
            PORT_VGA_B     => VGA_B,
            PORT_VGA_VSYNC => VGA_VSYNC,
            PORT_VGA_HSYNC => VGA_HSYNC
        );

    CLK_GEN_RESET <= '0';

end architecture arch;
