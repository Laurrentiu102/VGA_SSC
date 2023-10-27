library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.resolution.all;

entity horizontal_counter is
    port(
	     clk: in std_logic;
         horizontal_position: out natural
	     );
end horizontal_counter;

architecture Behavioral of horizontal_counter is

signal horizontal_position_counter: natural:=0;
begin
         process (clk)
         begin
           if rising_edge(clk) then
             if horizontal_position_counter = (HMAX - 1) then
               horizontal_position_counter <= 0;
             else
               horizontal_position_counter <= horizontal_position_counter + 1;
             end if;
           end if;
         end process;

         horizontal_position <= horizontal_position_counter;

end Behavioral;
