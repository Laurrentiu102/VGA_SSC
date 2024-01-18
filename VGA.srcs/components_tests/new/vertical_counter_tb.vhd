library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.resolution.all;

entity vertical_counter_tb is
end vertical_counter_tb;

architecture Behavioral of vertical_counter_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal horizontal_position_reg: integer:=0;
signal vertical_position_reg: integer:=0;

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
        horizontal_position_reg <= 0;
        wait for 10 ns;
        horizontal_position_reg <= HMAX - 1;
        wait;
    end process;
    
    vertical_counter_ut: entity work.vertical_counter port map( clk => clk, 
                                                                horizontal_position => horizontal_position_reg,
                                                                vertical_position => vertical_position_reg);

end Behavioral;
