library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div_25 is
    port(
         clk_in: in std_logic;
         clk_out: out std_logic
         );
end clk_div_25;

architecture Behavioral of clk_div_25 is

signal clk : std_logic := '0';
signal counter : integer range 0 to 3 := 0;

begin

process(clk_in)
begin
    if rising_edge(clk_in) then
            if counter = 3 then  -- Divide by 4
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
