--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:10:42 08/22/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/guia4_1/mysumadorRestador_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumadorRestador
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
 
ENTITY mysumadorRestador_tb IS
END mysumadorRestador_tb;
 
ARCHITECTURE behavior OF mysumadorRestador_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumadorRestador
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         s_r : IN  std_logic;
         ov : OUT  std_logic;
         resultado : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal s_r : std_logic := '0';

 	--Outputs
   signal ov : std_logic;
   signal resultado : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumadorRestador PORT MAP (
          a => a,
          b => b,
          s_r => s_r,
          ov => ov,
          resultado => resultado
        );

   -- Stimulus process
   stim_proc: process
   begin		
      a <= "0100"; b <= "0010"; s_r <= '0';
      wait for 100 ns;
		a <= "0100"; b <= "0010"; s_r <= '1';
      wait for 100 ns;
		a <= "0111"; b <= "0010"; s_r <= '0';
      wait for 100 ns;
		a <= "1000"; b <= "0010"; s_r <= '1';
      wait for 100 ns;
      wait;
   end process;

END;
