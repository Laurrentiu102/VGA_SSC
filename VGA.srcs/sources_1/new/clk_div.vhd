library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div is
    port(
         clk_in: in std_logic;
         clk_out: out std_logic
         );
end clk_div;

architecture Behavioral of clk_div is

signal clk : std_logic := '0';
signal counter : integer range 0 to 3 := 0;

begin

process(clk_in)
begin
    if rising_edge(clk_in) then
            if counter = 3 then
                counter <= 0;
                clk <= not clk;
            else
                counter <= counter + 1;
                clk <= '0';
            end if;
    end if;      
end process;

clk_out<=clk;

end Behavioral;
