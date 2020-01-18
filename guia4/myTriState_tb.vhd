--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:29:00 07/09/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/myTriState_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myTriState
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
 
ENTITY myTriState_tb IS
END myTriState_tb;
 
ARCHITECTURE behavior OF myTriState_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myTriState
    PORT(
         entrada : IN  std_logic;
         control : IN  std_logic;
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic := '0';
   signal control : std_logic := '0';

 	--Outputs
   signal salida : std_logic;

   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myTriState PORT MAP (
          entrada => entrada,
          control => control,
          salida => salida
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		entrada <= '0'; control <= '0';
		wait for clk;
		entrada <= '1'; control <= '0';
		wait for clk;
		entrada <= '0'; control <= '1';
		wait for clk;
		entrada <= '1'; control <= '1';
		wait for clk;
      wait;
   end process;

END;
