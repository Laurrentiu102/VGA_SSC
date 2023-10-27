library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.resolution.all;

entity vertical_sync is
    port(
	     clk: in std_logic;
    	 vertical_position: in natural;
    	 vertical_sync: out std_logic
	     );
end vertical_sync;

architecture Behavioral of vertical_sync is

begin

         process (clk)
         begin
           if rising_edge(clk) then
                 if vertical_position >= (VFP + VD - 1) and vertical_position < (VFP + VD + VSP - 1) then
                    vertical_sync <= V_POL;
                 else
                    vertical_sync <= not V_POL;
                 end if;
           end if; 
        end process;
end Behavioral;
