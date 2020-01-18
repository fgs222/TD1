--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:03:29 07/09/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/paridadGen_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: paridadGen
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
 
ENTITY paridadGen_tb IS
END paridadGen_tb;
 
ARCHITECTURE behavior OF paridadGen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT paridadGen
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         paridadSel : IN  std_logic;
         p : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal paridadSel : std_logic := '0';

 	--Outputs
   signal p : std_logic;
 
   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: paridadGen PORT MAP (
          a => a,
          paridadSel => paridadSel,
          p => p
        );

   -- Stimulus process
   stim_proc: process
   begin
      a <= "0000"; paridadSel <= '0';
		wait for clk;
		a <= "0001"; paridadSel <= '0';
		wait for clk;
		a <= "0010"; paridadSel <= '0';
		wait for clk;
		a <= "0011"; paridadSel <= '0';
		wait for clk;
		a <= "0100"; paridadSel <= '0';
		wait for clk;
		a <= "0101"; paridadSel <= '0';
		wait for clk;
		a <= "0110"; paridadSel <= '0';
		wait for clk;
		a <= "0111"; paridadSel <= '0';
		wait for clk;
		a <= "1000"; paridadSel <= '0';
		wait for clk;
		a <= "1001"; paridadSel <= '0';
		wait for clk;
		a <= "1010"; paridadSel <= '0';
		wait for clk;
		a <= "1011"; paridadSel <= '0';
		wait for clk;
		a <= "1100"; paridadSel <= '0';
		wait for clk;
		a <= "1101"; paridadSel <= '0';
		wait for clk;
		a <= "1110"; paridadSel <= '0';
		wait for clk;
		a <= "1111"; paridadSel <= '0';
		wait for clk;
		a <= "0000"; paridadSel <= '1';
		wait for clk;
		a <= "0001"; paridadSel <= '1';
		wait for clk;
		a <= "0010"; paridadSel <= '1';
		wait for clk;
		a <= "0011"; paridadSel <= '1';
		wait for clk;
		a <= "0100"; paridadSel <= '1';
		wait for clk;
		a <= "0101"; paridadSel <= '1';
		wait for clk;
		a <= "0110"; paridadSel <= '1';
		wait for clk;
		a <= "0111"; paridadSel <= '1';
		wait for clk;
		a <= "1000"; paridadSel <= '1';
		wait for clk;
		a <= "1001"; paridadSel <= '1';
		wait for clk;
		a <= "1010"; paridadSel <= '1';
		wait for clk;
		a <= "1011"; paridadSel <= '1';
		wait for clk;
		a <= "1100"; paridadSel <= '1';
		wait for clk;
		a <= "1101"; paridadSel <= '1';
		wait for clk;
		a <= "1110"; paridadSel <= '1';
		wait for clk;
		a <= "1111"; paridadSel <= '1';
		wait for clk;
      wait;
   end process;

END;
