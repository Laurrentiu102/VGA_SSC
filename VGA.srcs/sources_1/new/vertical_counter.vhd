library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.resolution.all;

entity vertical_counter is
    port(
	     clk: in std_logic;
    	 horizontal_position: in natural;
    	 vertical_position: out natural
	     );
end vertical_counter;

architecture Behavioral of vertical_counter is

signal vertical_position_counter:natural:=0;
begin
         process (clk)
         begin
           if rising_edge(clk) then
             if horizontal_position = (HMAX - 1) and vertical_position_counter = (VMAX - 1) then
               vertical_position_counter <= 0;
             elsif horizontal_position = (HMAX - 1) then
               vertical_position_counter <= vertical_position_counter + 1;
             end if;
           end if;
         end process;

         vertical_position<=vertical_position_counter;

end Behavioral;
