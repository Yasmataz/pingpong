--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:25:51 11/26/2020
-- Design Name:   
-- Module Name:   C:/Users/Yasamin/Documents/Classes/COE758/Spartan3E-master/RGB_test.vhd
-- Project Name:  VGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RGBGen
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
 
ENTITY RGB_test IS
END RGB_test;
 
ARCHITECTURE behavior OF RGB_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RGBGen
    PORT(
         clk : IN  std_logic;
			SW : in  STD_LOGIC_VECTOR (3 downto 0);
         vsync : OUT  std_logic;
         hsync : OUT  std_logic;
         vcount : OUT  integer;
         hcount : OUT  integer;
         R : OUT  std_logic_vector(7 downto 0);
         G : OUT  std_logic_vector(7 downto 0);
         B : OUT  std_logic_vector(7 downto 0);
			ball_left : out integer;
			ball_right : out integer;
			ball_top : out integer;
			ball_bottom : out integer;
			refresh_out : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal sw : std_logic_vector (3 downto 0);

 	--Outputs
   signal vsync : std_logic;
   signal hsync : std_logic;
   signal vcount : integer;
   signal hcount : integer;
   signal R : std_logic_vector(7 downto 0);
   signal G : std_logic_vector(7 downto 0);
   signal B : std_logic_vector(7 downto 0);
	signal ball_left : integer;
	signal ball_right : integer;
	signal ball_top : integer;
	signal ball_bottom : integer;
	signal refresh_out : std_logic;
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RGBGen PORT MAP (
          clk => clk,
			 sw => sw,
          vsync => vsync,
          hsync => hsync,
          vcount => vcount,
          hcount => hcount,
          R => R,
          G => G,
          B => B,
			 ball_left => ball_left,
			 ball_right => ball_right,
			 ball_top => ball_top,
			 ball_bottom => ball_bottom,
			 refresh_out => refresh_out
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
     -- wait for 100 ns;	

      wait for clk_period*1000;

      -- insert stimulus here 

      wait;
   end process;

END;
