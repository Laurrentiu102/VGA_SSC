library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.resolution.all;

entity horizontal_sync_tb is
end horizontal_sync_tb;

architecture Behavioral of horizontal_sync_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal horizontal_position_reg: integer:=0;
signal horizontal_sync_reg: std_logic;

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
        horizontal_position_reg <= (HFP + HD + HSP);
        wait for 10ns;
        horizontal_position_reg <= (HFP + HD - 1);
        wait for 10ns;
        horizontal_position_reg <= (HFP + HD + HSP);
        wait;
    end process;
    
    horizontal_sync_ut: entity work.horizontal_sync port map(clk => clk, 
                                                             horizontal_position => horizontal_position_reg,
                                                             horizontal_sync => horizontal_sync_reg);

end Behavioral;
