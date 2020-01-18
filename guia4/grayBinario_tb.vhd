--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:28:09 09/19/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/fstahl/Guia 4_1/grayBinario_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: grayBinario
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
 
ENTITY grayBinario_tb IS
END grayBinario_tb;
 
ARCHITECTURE behavior OF grayBinario_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT grayBinario
    PORT(
         gray : IN  std_logic_vector(7 downto 0);
         binario : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal gray : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal binario : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: grayBinario PORT MAP (
          gray => gray,
          binario => binario
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      gray <= "00110101";
		wait for 200 ns;
		
		gray <= "00000000";
		wait for 200 ns;
		
		gray <= "11110000";
		wait for 200 ns;
		
		gray <= "11011010";
		wait for 200 ns;
		
      wait;
   end process;

END;
