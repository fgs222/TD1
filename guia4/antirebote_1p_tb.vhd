--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:54:01 11/15/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/guia4/antirebote_1p_tb.vhd
-- Project Name:  guia4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: antirebote_1p
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
 
ENTITY antirebote_1p_tb IS
END antirebote_1p_tb;
 
ARCHITECTURE behavior OF antirebote_1p_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirebote_1p
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btnIn : IN  std_logic;
         btnOut : OUT  std_logic;
         btnValid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btnIn : std_logic := '0';

 	--Outputs
   signal btnOut : std_logic;
   signal btnValid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirebote_1p PORT MAP (
          clk => clk,
          rst => rst,
          btnIn => btnIn,
          btnOut => btnOut,
          btnValid => btnValid
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
      rst <='1';
		wait for clk_period;
		rst <= '0';
		wait for clk_period;
		btnIn <= '1';
		wait for clk_period * 20;
		btnIn <= '0';
		wait for clk_period;
		btnIn <= '1';
		wait for clk_period;
		btnIn <= '0';
		wait for clk_period * 10;

      wait;
   end process;

END;
