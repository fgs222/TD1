--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:12:37 08/22/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/FFT_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FFT
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
 
ENTITY FFT_tb IS
END FFT_tb;
 
ARCHITECTURE behavior OF FFT_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FFT
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         t : IN  std_logic;
         q : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal t : std_logic := '0';

 	--Outputs
   signal q : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FFT PORT MAP (
          clk => clk,
          rst => rst,
          t => t,
          q => q
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
      t <= '0'; rst <= '1';
      wait for 100 ns;
      t <= '0'; rst <= '0';
      wait for 100 ns;
      t <= '0'; rst <= '0';
      wait for 100 ns;	
      t <= '1'; rst <= '0';
      wait for 100 ns;
      t <= '1'; rst <= '0';
      wait for 100 ns;
      t <= '1'; rst <= '0';
      wait for 100 ns;			
      wait;
   end process;

END;
