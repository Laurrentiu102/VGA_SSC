library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.resolution.all;

entity horizontal_sync is
    port(
	     clk: in std_logic;
    	 horizontal_position: in natural;
    	 horizontal_sync: out std_logic
	     );
end horizontal_sync;

architecture Behavioral of horizontal_sync is

begin
         process (clk)
         begin
           if rising_edge(clk) then
                 if horizontal_position >= (HFP + HD - 1) and horizontal_position < (HFP + HD + HSP - 1) then
                   horizontal_sync <= H_POL;
                 else
                   horizontal_sync <= not H_POL;
                 end if;
           end if;
         end process;

end Behavioral;
