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
           rcount : out  integer;
           rclk : out  STD_LOGIC);
end refreshClk;

architecture Behavioral of refreshClk is

signal refresh_clk : std_logic := '0';
signal refreshcnt : integer:= 0;

begin
process(clk)
	begin
		if clk'event and clk='1' then
			if (refreshcnt >= 416667) then
				refresh_clk <= '1';
				refreshcnt <= 0;
			else
				refresh_clk <= '0';
				refreshcnt <= refreshcnt + 1;
			end if;
		end if;
end process;

rcount <= refreshcnt;
rclk <= refresh_clk;

end Behavioral;

