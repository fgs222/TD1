--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:39:13 08/08/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/myDivMag8_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myDivMag8
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
 
ENTITY myDivMag8_tb IS
END myDivMag8_tb;
 
ARCHITECTURE behavior OF myDivMag8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myDivMag8
    PORT(
         entrada : IN  std_logic_vector(7 downto 0);
         div : IN  std_logic_vector(1 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada : std_logic_vector(7 downto 0) := (others => '0');
   signal div : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
 
   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myDivMag8 PORT MAP (
          entrada => entrada,
          div => div,
          salida => salida
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		entrada <= "11111111"; div <= "00";
      wait for clk;
		entrada <= "11111111"; div <= "01";
      wait for clk;
		entrada <= "11111111"; div <= "10";
      wait for clk;
		entrada <= "11111111"; div <= "11";
      wait for clk;
		wait;
   end process;

END;
