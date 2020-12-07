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
USE ieee.numeric_std.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all

entity VGAController is
	port (
		clk : in std_logic;
		vsync: out std_logic;
		hsync : out std_logic;
		vcount : out std_logic_vector(9 downto 0);
		hcount : out std_logic_vector(9 downto 0)
		);
		
end VGAController;

architecture Behavioral of VGAController is
	
	signal vcount_s : std_logic_vector(9 downto 0) := "0000000000";
	signal hcount_s : std_logic_vector(9 downto 0) := "0000000000";	
	signal hsync_s : std_logic := '1';
	signal vsync_s : std_logic := '1';	
	
	signal pixel_clk : std_logic := '0';

	component clock_divider
		 Port ( clk : in  STD_LOGIC;
				  p_clk : out  STD_LOGIC);
	end component;

begin

DAC_clock : clock_divider
PORT MAP (
		clk => clk,
		p_clk => pixel_clk
	);
	
process (pixel_clk)
	begin
		if pixel_clk'event and pixel_clk = '1' then
		-- horizontal counts from 0 to 799
			hcount_s <= hcount_s + 1;
			hsync_s <= '0';
			vsync_s <= '0';

			if (hcount_s = 799) then
				vcount_s <= vcount_s+1;
				hcount_s <= "0000000000";
			end if;
		
		-- vertical counts from 0 to 524
			if (vcount_s = 524) then
				vcount_s <= "0000000000";
			end if;
			
			if (to_integer(unsigned(hcount_s)) < 96) then
				hsync_s <= '1';
			end if;
			
			if (to_integer(unsigned(vcount_s)) < 2) then
				vsync_s <= '1';
			end if;
			
			hsync <= hsync_s;
			vsync <= vsync_s;
			hcount <= hcount_s;
			vcount <= vcount_s;
			
		end if;
	end process;

end Behavioral;

