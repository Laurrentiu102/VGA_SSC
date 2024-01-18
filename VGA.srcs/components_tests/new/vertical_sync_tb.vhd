library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.resolution.all;

entity vertical_sync_tb is
end vertical_sync_tb;

architecture Behavioral of vertical_sync_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal vertical_position_reg: integer:=0;
signal vertical_sync_reg: std_logic;

begin

    process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    process
    begin
        vertical_position_reg <= (VFP + VD + VSP);
        wait for 10ns;
        vertical_position_reg <= (VFP + VD - 1);
        wait for 10ns;
        vertical_position_reg <= (VFP + VD + VSP);
        wait;
    end process;
    
    vertical_sync_ut: entity work.vertical_sync port map(clk => clk,
                                                         vertical_position => vertical_position_reg,
                                                         vertical_sync => vertical_sync_reg);


end Behavioral;
