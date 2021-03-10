library ieee;
use ieee.std_logic_1164.all;

library xpm;
use xpm.vcomponents.all;

entity synchronizer is
    port (
        SRC_ASYNC : in std_logic;
        DST_CLK   : in std_logic;
        DST_SYNC  : out std_logic
    );
end entity synchronizer;


architecture arch of synchronizer is
begin
    
    xpm_cdc_single_instance : xpm_cdc_single
        generic map (
            DEST_SYNC_FF   => 2,
            INIT_SYNC_FF   => 0,
            SIM_ASSERT_CHK => 0,
            SRC_INPUT_REG  => 0
        )
        port map (
            SRC_CLK  => '0',
            SRC_IN   => SRC_ASYNC,
            DEST_CLK => DST_CLK,
            DEST_OUT => DST_SYNC
        );

end architecture arch;
