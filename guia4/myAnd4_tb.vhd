--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:39:47 07/09/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/myAnd4_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myAnd4
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
 
ENTITY myAnd4_tb IS
END myAnd4_tb;
 
ARCHITECTURE behavior OF myAnd4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myAnd4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic;
 
   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myAnd4 PORT MAP (
          a => a,
          c => c
        );
 
   -- Stimulus process
   stim_proc: process
   begin		
		a <= "0000";
      wait for clk;
		a <= "0001";
      wait for clk;
		a <= "0010";
      wait for clk;
		a <= "0011";
      wait for clk;
		a <= "0100";
      wait for clk;
		a <= "0111";
      wait for clk;
		a <= "1000";
      wait for clk;
		a <= "1001";
      wait for clk;
		a <= "1010";
      wait for clk;
		a <= "1011";
      wait for clk;
		a <= "1100";
      wait for clk;
		a <= "1101";
      wait for clk;
		a <= "1110";
      wait for clk;
		a <= "1111";
      wait for clk;
      wait;
   end process;

END;
