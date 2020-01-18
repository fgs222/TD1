--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:03:42 11/07/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/guia4/myFifo_tb.vhd
-- Project Name:  guia4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myFifo
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
 
ENTITY myFifo_tb IS
END myFifo_tb;
 
ARCHITECTURE behavior OF myFifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myFifo
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         din : IN  std_logic_vector(7 downto 0);
         wrEna : IN  std_logic;
         dout : OUT  std_logic_vector(7 downto 0);
         rdEna : IN  std_logic;
         full : OUT  std_logic;
         mid : OUT  std_logic;
         empty : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal din : std_logic_vector(7 downto 0) := (others => '0');
   signal wrEna : std_logic := '0';
   signal rdEna : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(7 downto 0);
   signal full : std_logic;
   signal mid : std_logic;
   signal empty : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myFifo PORT MAP (
          clk => clk,
          rst => rst,
          din => din,
          wrEna => wrEna,
          dout => dout,
          rdEna => rdEna,
          full => full,
          mid => mid,
          empty => empty
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
		rst<='1';
		din<= "00000000";
      wait for 100 ns;
		rst<='0';
		din<= "11110001";
		wait for 100 ns;
		rst<='0';
		din<= "11111111";	
	wait for clk_period*10000;
	wait;
   end process;

END;
