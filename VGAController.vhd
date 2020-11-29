----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:06 11/09/2014 
-- Design Name: 
-- Module Name:    VGAController - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGAController is
	port (
		clk : in std_logic;
		vsync : out std_logic;
		hsync : out std_logic;
		vcount : out integer;
		hcount : out integer
		);
		
end VGAController;

architecture Behavioral of VGAController is


	signal hcount_s : integer := 0;
	signal vcount_s : integer := 0;	
	signal hsync_s : std_logic;
	signal vsync_s : std_logic;	
begin 
process (clk)
	begin
		if clk'event and clk = '1' then
		-- horizontal counts from 0 to 799
			hcount_s <= hcount_s+1;
			hsync_s <= '0';
			vsync_s <= '0';

			if (hcount_s = 800) then
				vcount_s <= vcount_s+1;
				hcount_s <= 0;
			end if;
		
		-- vertical counts from 0 to 524
			if (vcount_s = 525) then
				vcount_s <= 0;
			end if;
			
			if (hcount_s < 96) then
				hsync_s <= '1';
			else
				hsync_s <= '0';
			end if;
			
			if (vcount_s < 2) then
				vsync_s <= '1';
			else
				vsync_s <= '0';
			end if;
			
			
			
		end if;
	end process;

	hsync <= hsync_s;
	vsync <= vsync_s;
	hcount <= hcount_s;
	vcount <= vcount_s;


end Behavioral;

