library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.resolution.all;

entity vga_controller is
    port( 
         clk_board: in std_logic;
         horizontal_sync_o: out std_logic;
         vertical_sync_o: out std_logic;
 		 vga_red_o : out STD_LOGIC_VECTOR (3 downto 0);
 		 vga_green_o : out STD_LOGIC_VECTOR (3 downto 0);
 		 vga_blue_o : out STD_LOGIC_VECTOR (3 downto 0)
         );
end vga_controller;

architecture Behavioral of vga_controller is

signal clk: std_logic;
signal draw: std_logic;
signal horizontal_position:natural:= 0;
signal vertical_position:natural:=0;

component clk_mul is
    port(clk_in1 : in std_logic;
         clk_out1 : out std_logic);
end component;

component horizontal_counter is
    port(
	     clk: in std_logic;
         horizontal_position: out natural
	     );
end component;

component vertical_counter is
    port(
	     clk: in std_logic;
    	 horizontal_position: in natural;
    	 vertical_position: out natural
	     );
end component;

component horizontal_sync is
    port(
	     clk: in std_logic;
    	 horizontal_position: in natural;
    	 horizontal_sync: out std_logic
	     );
end component;

component vertical_sync is
    port(
	     clk: in std_logic;
    	 vertical_position: in natural;
    	 vertical_sync: out std_logic
	     );
end component;

component bram is
    port(
         clk: in std_logic;
         read_address: in natural;
         read_data: out std_logic_vector(11 downto 0)
         );
end component;

signal read_address:natural:=0;
signal data:std_logic_vector(11 downto 0);

begin

    ram: bram port map(
        clk => clk,
        read_address => read_address,
        read_data => data
        );

    clk_gen: clk_mul port map(
        clk_in1 => clk_board,
        clk_out1 => clk
        );

    hc: horizontal_counter port map(
        clk => clk,
        horizontal_position => horizontal_position
        );
    
    vc: vertical_counter port map(
        clk => clk,
        horizontal_position => horizontal_position,
        vertical_position => vertical_position
        );
        
    hs: horizontal_sync port map(
        clk => clk,
        horizontal_position => horizontal_position,
        horizontal_sync => horizontal_sync_o
        );
        
    vs: vertical_sync port map(
        clk => clk,
        vertical_position => vertical_position,
        vertical_sync => vertical_sync_o
        );       
    
    draw <= '1' when horizontal_position < HD and vertical_position < VD else '0';

    process (clk)
     	 begin
       		if (rising_edge(clk)) then
				if draw='1' then
				    
				    if horizontal_position < 300 and vertical_position < 300 then
				        if read_address < (PICTURE_RESOLUTION-1) then
				            read_address<=read_address+1;
				        else
				            read_address<=0;
				        end if;
				        
				        vga_red_o <= data(11 downto 8);
				        vga_green_o <= data(7 downto 4);
				        vga_blue_o <= data(3 downto 0);
				    else
				        vga_red_o    <= "0000";
         			    vga_green_o  <= "0000";
         			    vga_blue_o   <= "0000";
				    end if;

				else
					vga_red_o    <= "0000";
         			vga_green_o  <= "0000";
         			vga_blue_o   <= "0000";
				end if;      
       		end if;
     	end process;
end Behavioral;
