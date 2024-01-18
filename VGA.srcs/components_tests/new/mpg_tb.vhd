library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mpg_tb is
end mpg_tb;

architecture Behavioral of mpg_tb is

CONSTANT CLK_PERIOD: TIME := 1 ns;

signal clk: std_logic;
signal btn_in, btn_out: std_logic;

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
        btn_in <= '0';
        wait for 10ns;
        btn_in <= '1';
        wait;
    end process;
    
    mpg_ut: entity work.mpg port map(clk => clk, btn_in => btn_in, btn_out => btn_out);
end Behavioral;
