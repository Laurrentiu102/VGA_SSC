library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity horizontal_counter_tb is
end horizontal_counter_tb;

architecture Behavioral of horizontal_counter_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal horizontal_position_reg: integer:=0;

begin

    process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;

    horizontal_counter_ut: entity work.horizontal_counter port map(clk => clk, horizontal_position => horizontal_position_reg);
    
end Behavioral;
