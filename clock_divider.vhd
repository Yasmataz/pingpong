----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:48:54 12/04/2020 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

entity clock_divider is
    Port ( clk : in  STD_LOGIC;
           p_clk : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is

signal pixel_clk : std_logic := '0';

begin
process (clk)
    begin
    if clk'event and clk='1' then
		if (pixel_clk = '1') then
			pixel_clk <= '0';
		else
			pixel_clk <= '1';
		end if;
	  end if;
end process;

p_clk <= pixel_clk;


end Behavioral;

