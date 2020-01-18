--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:26:56 09/19/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/fstahl/Guia 4_1/conversorBinarioGray_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: conversorBinarioGray
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
 
ENTITY conversorBinarioGray_tb IS
END conversorBinarioGray_tb;
 
ARCHITECTURE behavior OF conversorBinarioGray_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT conversorBinarioGray
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         salida : OUT  std_logic_vector(7 downto 0);
         sel : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: conversorBinarioGray PORT MAP (
          entrada => entrada,
          salida => salida,
          sel => sel
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      entrada <= "00011000";
		sel	  <= '0';
		wait for 200 ns;
		
		entrada <= "11100001";
		sel	  <= '0';
		wait for 200 ns;
		
		entrada <= "01111010";
		sel	  <= '1';
		wait for 200 ns;
		
		entrada <= "10010011";
		sel	  <= '1';
		wait for 200 ns;

      wait;
   end process;

END;
