--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:13:15 07/09/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/myMux4_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myMux4
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
 
ENTITY myMux4_tb IS
END myMux4_tb;
 
ARCHITECTURE behavior OF myMux4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myMux4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(1 downto 0);
         s : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic;
 
   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myMux4 PORT MAP (
          a => a,
          c => c,
          s => s
        );

   -- Stimulus process
   stim_proc: process
   begin		
      a <= "0000"; c <= "00";
		wait for clk;
		a <= "0001"; c <= "00";
		wait for clk;
		a <= "0010"; c <= "00";
		wait for clk;
		a <= "0011"; c <= "00";
		wait for clk;
		a <= "0100"; c <= "00";
		wait for clk;
		a <= "0101"; c <= "00";
		wait for clk;
		a <= "0110"; c <= "00";
		wait for clk;
		a <= "0111"; c <= "00";
		wait for clk;
		a <= "1000"; c <= "00";
		wait for clk;
		a <= "1001"; c <= "00";
		wait for clk;
		a <= "1010"; c <= "00";
		wait for clk;
		a <= "1011"; c <= "00";
		wait for clk;
		a <= "1100"; c <= "00";
		wait for clk;
		a <= "1101"; c <= "00";
		wait for clk;
		a <= "1110"; c <= "00";
		wait for clk;
		a <= "1111"; c <= "00";
		wait for clk;
		a <= "0000"; c <= "01";
		wait for clk;
		a <= "0001"; c <= "01";
		wait for clk;
		a <= "0010"; c <= "01";
		wait for clk;
		a <= "0011"; c <= "01";
		wait for clk;
		a <= "0100"; c <= "01";
		wait for clk;
		a <= "0101"; c <= "01";
		wait for clk;
		a <= "0110"; c <= "01";
		wait for clk;
		a <= "0111"; c <= "01";
		wait for clk;
		a <= "1000"; c <= "01";
		wait for clk;
		a <= "1001"; c <= "01";
		wait for clk;
		a <= "1010"; c <= "01";
		wait for clk;
		a <= "1011"; c <= "01";
		wait for clk;
		a <= "1100"; c <= "01";
		wait for clk;
		a <= "1101"; c <= "01";
		wait for clk;
		a <= "1110"; c <= "01";
		wait for clk;
		a <= "1111"; c <= "01";
		wait for clk;
		a <= "0000"; c <= "10";
		wait for clk;
		a <= "0001"; c <= "10";
		wait for clk;
		a <= "0010"; c <= "10";
		wait for clk;
		a <= "0011"; c <= "10";
		wait for clk;
		a <= "0100"; c <= "10";
		wait for clk;
		a <= "0101"; c <= "10";
		wait for clk;
		a <= "0110"; c <= "10";
		wait for clk;
		a <= "0111"; c <= "10";
		wait for clk;
		a <= "1000"; c <= "10";
		wait for clk;
		a <= "1001"; c <= "10";
		wait for clk;
		a <= "1010"; c <= "10";
		wait for clk;
		a <= "1011"; c <= "10";
		wait for clk;
		a <= "1100"; c <= "10";
		wait for clk;
		a <= "1101"; c <= "10";
		wait for clk;
		a <= "1110"; c <= "10";
		wait for clk;
		a <= "1111"; c <= "10";
		wait for clk;
		a <= "0000"; c <= "11";
		wait for clk;
		a <= "0001"; c <= "11";
		wait for clk;
		a <= "0010"; c <= "11";
		wait for clk;
		a <= "0011"; c <= "11";
		wait for clk;
		a <= "0100"; c <= "11";
		wait for clk;
		a <= "0101"; c <= "11";
		wait for clk;
		a <= "0110"; c <= "11";
		wait for clk;
		a <= "0111"; c <= "11";
		wait for clk;
		a <= "1000"; c <= "11";
		wait for clk;
		a <= "1001"; c <= "11";
		wait for clk;
		a <= "1010"; c <= "11";
		wait for clk;
		a <= "1011"; c <= "11";
		wait for clk;
		a <= "1100"; c <= "11";
		wait for clk;
		a <= "1101"; c <= "11";
		wait for clk;
		a <= "1110"; c <= "11";
		wait for clk;
		a <= "1111"; c <= "11";
		wait for clk;
      wait;
   end process;

END;
