library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mpg is
    port(
         clk: in std_logic;
         btn_in : in std_logic;
         btn_out: out std_logic
         );
end mpg;

architecture Behavioral of mpg is

signal counter: std_logic_vector(15 downto 0):=(others=>'0');
signal Q1,Q2,Q3: std_logic:='0';

begin

btn_out<=not(Q3) and Q2;

process(clk)
begin
    if rising_edge(clk) then
        counter<=counter+1;
        if counter="1111111111111111" then
            Q1<=btn_in;
        end if;
        Q2<=Q1;
        Q3<=Q2;
    end if;
end process;

end Behavioral;
