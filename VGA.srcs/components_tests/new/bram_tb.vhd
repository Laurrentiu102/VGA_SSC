library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bram_tb is
end bram_tb;

architecture Behavioral of bram_tb is

CONSTANT CLK_PERIOD: TIME := 10 ns;

signal clk: std_logic;
signal btn_in: std_logic:='0';
signal read_address: natural:=0;
signal read_data: std_logic_vector(11 downto 0);

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
        read_address <= 0;
        wait for 10ns;
        read_address <= read_address + 1;
        wait for 10ns;
        read_address <= read_address + 1;
        wait;
    end process;
    
    bram_ut: entity work.bram port map(clk => clk, btn_in => btn_in, read_address => read_address, read_data => read_data);
    
end Behavioral;
