
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity RGBGen is
	port(
		clk : in std_logic;
		SW : in  STD_LOGIC_VECTOR (3 downto 0);
		DAC_CLK : out std_logic;
		V : out std_logic;
		H : out std_logic;
		vcount : out std_logic_vector(9 downto 0);
		hcount : out std_logic_vector(9 downto 0);
		Rout : out std_logic_vector(7 downto 0);
		Gout : out std_logic_vector(7 downto 0);
		Bout : out std_logic_vector(7 downto 0);
		ball_left : out integer;
		ball_right : out integer;
		ball_top : out integer;
		ball_bottom : out integer;
		paddle1_top : out integer;
	   paddle1_bottom : out integer;
		refresh_out: out std_logic
		);
end RGBGen;

architecture Behavioral of RGBGen is
signal vsync_s : std_logic;
signal hsync_s : std_logic;
signal hcount_s : std_logic_vector(9 downto 0) := "0000000000";
signal vcount_s : std_logic_vector(9 downto 0) := "0000000000";

signal rclk_s : std_logic;
signal rcount_s : integer;

signal x: integer range 0 to 639;
signal y: integer range 0 to 479;

--mapping static components
--
--         (h1)
--  --------------------
-- |         |          |
-- |(v1)     |          |(v3)
--           |
--           |
-- |(v2)     |          |(v4)
-- |         |          |
--  --------------------
--         (h2)
-- Layout:
--    y1
-- x1    x2
--    y2

--vertcal bar1 
signal v1_x1: integer := 30;
signal v1_x2: integer := 50;
signal v1_y1: integer := 50;
signal v1_y2: integer := 140;

--vertical bar2
signal v2_x1: integer := 30;
signal v2_x2: integer := 50;
signal v2_y1: integer := 340;
signal v2_y2: integer := 430;

--horizontal bar1
signal h1_x1: integer := 30;
signal h1_x2: integer := 610;
signal h1_y1: integer := 30;
signal h1_y2: integer := 49;

--horizontal bar2
signal h2_x1: integer := 30;
signal h2_x2: integer := 610;
signal h2_y1: integer := 429;
signal h2_y2: integer := 450;

--vertical bar3
signal v3_x1: integer := 590;
signal v3_x2: integer := 609;
signal v3_y1: integer := 50;
signal v3_y2: integer := 140;

--vertical bar4
signal v4_x1: integer := 590;
signal v4_x2: integer := 609;
signal v4_y1: integer := 340;
signal v4_y2: integer := 430;

--midfield line
signal mf_x1: integer := 319;
signal mf_x2: integer := 321;
signal mf_y1: integer := 30;
signal mf_y2: integer := 450;

-- Dynamic components --

--ball
signal ball_x1: integer := 295;
signal ball_x2: integer := 345;
signal ball_y1: integer := 215;
signal ball_y2: integer := 265;

--padle1
signal p1_x1: integer := 80;
signal p1_x2: integer := 110;
signal p1_y1: integer := 190;
signal p1_y2: integer := 290;

--padle2
signal p2_x1: integer := 530;
signal p2_x2: integer := 560;
signal p2_y1: integer := 190;
signal p2_y2: integer := 290;

-- Game controll signals --
signal goal_scored: std_logic := '0';
signal move_right: std_logic; --1 = right, 0 = left
signal move_up: std_logic; --1 = down, 0 = up

signal d_clk : std_logic;

component VGAController
	port (
		clk : in std_logic;
		vsync : out std_logic;
		hsync : out std_logic;
		vcount : out std_logic_vector(9 downto 0);
		hcount : out std_logic_vector(9 downto 0)
	);
end component;

component refreshClk
	port (
		clk : in  STD_LOGIC;
      rclk : out  STD_LOGIC
	);
end component;

component clock_divider
    Port ( clk : in  STD_LOGIC;
           p_clk : out  STD_LOGIC);
end component;


begin


myVGAController : VGAController
PORT MAP (
	 clk => clk,
	 vsync => vsync_s,
	 hsync => hsync_s,
	 vcount => vcount_s,
	 hcount => hcount_s
 );

myRefreshClk : refreshClk
PORT MAP (
	clk => clk,
	rclk => rclk_s
);
	
DAC_clock : clock_divider
PORT MAP (
	clk => clk,
	p_clk => d_clk
);
DAC_CLK <= d_clk;

process(d_clk)
begin
	if(d_clk'Event and d_clk = '1') then
	
		--isolating active region
		x <= to_integer(unsigned(hcount_s)) - 143;
		y <= to_integer(unsigned(vcount_s)) - 33;
		
		--active region check
		if(to_integer(unsigned(hcount_s)) < 784 and to_integer(unsigned(hcount_s)) > 143 and to_integer(unsigned(vcount_s)) < 515 and to_integer(unsigned(vcount_s)) > 34) then --within active range
			
			------------------------------------------------------------------------
			---------------------------- static components -------------------------
			------------------------------------------------------------------------
			
			--initially set background to green
			Rout <= "00000000";
			Gout <= "11111111";
			Bout <= "00000000";
					
			--Displaying white boundries
			if((x >= v1_x1 and x <= v1_x2 and y >= v1_y1 and y <= v1_y2) or --vertical bar 1
				(x >= v2_x1 and x <= v2_x2 and y >= v2_y1 and y <= v2_y2) or --vertical bar 2
				(x >= h1_x1 and x <= h1_x2 and y >= h1_y1 and y <= h1_y2) or --horizontal bar 1
				(x >= h2_x1 and x <= h2_x2 and y >= h2_y1 and y <= h2_y2) or --horizontal bar2
				(x >= v3_x1 and x <= v3_x2 and y >= v3_y1 and y <= v3_y2) or --vertical bar 3
				(x >= v4_x1 and x <= v4_x2 and y >= v4_y1 and y <= v4_y2) or --vertical bar 3
				(x >= mf_x1 and x <= mf_x2 and y >= mf_y1 and y <= mf_y2))then --midfield line
					
				Rout <= "11111111";
				Gout <= "11111111";
				Bout <= "11111111";
			
			end if;
			
			------------------------------------------------------------------------
			--------------------------- Dynamic components -------------------------
			------------------------------------------------------------------------
			
			--ball
			if(x >= ball_x1 and x <= ball_x2 and y >= ball_y1 and y <= ball_y2) then
				if(goal_scored = '1') then
					Rout <= "11111111";
					Gout <= "00000000";
					Bout <= "00000000";
				else
					Rout <= "11111111";
					Gout <= "11111111";
					Bout <= "00000000";
				end if;
			
			--padle 1
			elsif(x >= p1_x1 and x <= p1_x2 and y >= p1_y1 and y <= p1_y2) then
				Rout <= "00000000";
				Gout <= "00000000";
				Bout <= "11111111";
				
			--padle 2
			elsif(x >= p2_x1 and x <= p2_x2 and y >= p2_y1 and y <= p2_y2) then
				Rout <= "11111111";
				Gout <= "00000000";
				Bout <= "11111111";
			end if;
			
		else -- outside active region -> RGB outputs must be off
			Rout <= "00000000";
			Gout <= "00000000";
			Bout <= "00000000";
		end if;
		
		--update dynamic elements every frame
		--if rclk_s'event and rclk_s = '1' then
		if rclk_s = '1' then
			--------------------------- Padle logic -------------------------
			--paddle 1 up if space
			--if (SW(0) = '1' and p1_y1 < h1_y2) then 
			p1_y1 <= p1_y1 - 1;
			p1_y2 <= p1_y2 - 1;

			--paddle 1 down
			if (SW(1) = '1' and p1_y2 > h2_y1) then 	
				p1_y1 <= p1_y1 + 1;
				p1_y2 <= p1_y2 + 1;
			end if;
			
			--paddle 2 up
			if(SW(2) = '1' and p2_y1 < h1_y2) then
				p2_y1 <= p2_y1 - 1;
				p2_y2 <= p2_y2 - 1;
				
			--paddle 2 down
			elsif(SW(3) = '1' and p2_y2 > h2_y1) then
				p2_y1 <= p2_y1 + 1;
				p2_y2 <= p2_y2 + 1;
			end if;
			
			--------------------------- Collision Detection (edges) -------------------------
			
			--ball hits top (h1)
			if(ball_y1 <= h1_y2) then
				move_up <= '0';
			
			--ball hits bottom (h2)
			elsif(ball_y2 >= h2_y1) then
				move_up <= '1';
			
			--ball hits left side (v1)
			elsif(ball_x1 <= v1_x2 and ball_y1 < v1_y2) then 
				move_right <= '1';
			
			--ball hits left side (v2)
			elsif(ball_x1 <= v2_x2 and ball_y2 > v2_y1) then
				move_right <= '1';
			
			--ball hits right side (v3)
			elsif(ball_x2 >= v3_x1 and ball_y1 < v3_y2) then
				move_right <= '0';
			
			--ball hits right side (v4)
			elsif(ball_x2 <= v4_x1 and ball_y2 > v4_y1) then
				move_right <= '0';
			end if;

			--------------------------- Collision Detection (paddles) -------------------------
			
			--left paddle hit (p1)
			if(ball_x1 <= p1_x2 and ball_y2 > p1_y1 and ball_y2 < p1_y2) then
				move_right <= '1';
			
			--right paddle hit (p2)
			elsif(ball_x2 >= p2_x1 and ball_y2 > p2_y1 and ball_y2 < p2_y2) then
				move_right <= '0';
			end if;

			--------------------------- Goal Detection -------------------------
			
			--left goal
			if(ball_x1 < v1_x1 and ball_y1 > v1_y2 and ball_y2 < v3_y1) then
				goal_scored <= '1';
				ball_x1 <= 295;
				ball_x2 <= 345;
				ball_y1 <= 215;
				ball_y2 <= 265;
				
			--right goal
			elsif(ball_x2 > v3_x2 and ball_y1 > v3_y2 and ball_y2 < v4_y1) then
				goal_scored <= '1';
				ball_x1 <= 295;
				ball_x2 <= 345;
				ball_y1 <= 215;
				ball_y2 <= 265;
				
			--no goal scored	
			else
				goal_scored <= '0';
			end if;

			--------------------------- Ball movement update -------------------------
			--move right
			if(move_right = '1') then
				ball_x1 <= ball_x1 + 1;
				ball_x2 <= ball_x2 + 1;
			
			--move left (default)
			else
				ball_x1 <= ball_x1 - 1;
				ball_x2 <= ball_x2 - 1;
			end if;
			
			--move up
			if(move_up = '1') then
				ball_y1 <= ball_y1 - 1;
				ball_y2 <= ball_y2 - 1;
			
			--move down (default)
			else
				ball_y1 <= ball_y1 + 1;
				ball_y2 <= ball_y2 + 1;
			end if;
		end if;
		
		
		V <= vsync_s;
		H <= hsync_s;
		vcount <= vcount_s;
		hcount <= hcount_s;
		
		ball_left <= ball_x1;
		ball_right <= ball_x2;
		ball_top <= ball_y1;
		ball_bottom <= ball_y2;
		
		paddle1_top <= p1_y1;
	   paddle1_bottom <= p1_y2;
		
		refresh_out <= rclk_s;
	end if;
end process;

end Behavioral;

