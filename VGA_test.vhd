--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:19:20 11/26/2020
-- Design Name:   
-- Module Name:   C:/Users/Yasamin/Documents/Classes/COE758/Spartan3E-master/VGA_test.vhd
-- Project Name:  VGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGAController
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY VGA_test IS
END VGA_test;
 
ARCHITECTURE behavior OF VGA_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGAController
    port (
		clk : in std_logic;
		vsync : out std_logic;
		hsync : out std_logic;
		vcount : out integer;
		hcount : out integer
		);
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
	signal hsync : std_logic;
	signal vsync : std_logic;
   signal vcount : integer;
   signal hcount : integer;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGAController PORT MAP (
          clk => clk,
			 vsync => vsync,
			 hsync => hsync,
          vcount => vcount,
          hcount => hcount
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*1000;

      -- insert stimulus here 

      wait;
   end process;

END;
