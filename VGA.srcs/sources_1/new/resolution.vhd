library IEEE;
use IEEE.std_logic_1164.all;

package resolution is 
constant HD : natural := 640;
constant VD : natural := 480;
constant PICTURE_RESOLUTION : natural := 300*300;

constant HFP : natural := 16;
constant HSP : natural := 96;
constant HMAX : natural := 800;

constant VFP : natural := 10;
constant VSP : natural := 2; 
constant VMAX : natural := 525; 

constant H_POL : std_logic := '0';
constant V_POL : std_logic := '0';
end package resolution;
