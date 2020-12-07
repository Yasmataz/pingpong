----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:57 11/26/2020 
-- Design Name: 
-- Module Name:    refreshClk - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity refreshClk is
    Port ( clk : in  STD_LOGIC;
           rclk : out  STD_LOGIC);
end refreshClk;

architecture Behavioral of refreshClk is

signal refresh_clk : std_logic := '0';
signal pixel_clk : std_logic := '0';
signal count : integer:= 0;

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

process(pixel_clk)
	begin
		if pixel_clk='1' then
			if (count >= 416667) then
				refresh_clk <= '1';
				count <= 0;
			else
				refresh_clk <= '0';
				count <= count + 1;
			end if;
		end if;
end process;

rclk <= refresh_clk;

end Behavioral;

