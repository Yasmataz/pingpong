----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:02 12/04/2020 
-- Design Name: 
-- Module Name:    pixle_clk - Behavioral 
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

entity pixle_clk is
    Port ( clk : in  STD_LOGIC;
           p_clk : out  STD_LOGIC);
end pixle_clk;

architecture Behavioral of pixle_clk is

signal pixel_clk : std_logic;

begin
process (clk)
    begin
    if clk'event and clk='1' then
        pixel_clk <= NOT(pixel_clk);
    end if;
end process;

--Mapping the pixel clock to the DAC_CLK output
DClk <= pixel_clk;


end Behavioral;

