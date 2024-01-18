library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div_tb is
end clk_div_tb;

architecture Behavioral of clk_div_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal clk_out: std_logic;

begin
    
    process
    begin
        clk <= '0';
        wait for CLK_PERIOD/2;
        clk <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    clk_div_ut: entity work.clk_div port map(clk_in => clk, clk_out => clk_out);


end Behavioral;
