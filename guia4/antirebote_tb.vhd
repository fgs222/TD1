--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:46:17 10/24/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/guia4/antirebote_tb.vhd
-- Project Name:  guia4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: antirebote
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
 
ENTITY antirebote_tb IS
END antirebote_tb;
 
ARCHITECTURE behavior OF antirebote_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirebote
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         btnIn : IN  std_logic_vector(3 downto 0);
         btnOut : OUT  std_logic_vector(3 downto 0);
         btnValid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal btnIn : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal btnOut : std_logic_vector(3 downto 0);
   signal btnValid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirebote PORT MAP (
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
       -- hold reset state for 100 ns.
		rst <= '1';
		btnIn(0) <= '0';
		btnIn(1) <= '0';
		btnIn(2) <= '0';
		btnIn(3) <= '0';
      wait for 10 ns;
		rst <= '0';
		btnIn(0) <= '1';
		btnIn(1) <= '0';
		btnIn(2) <= '0';
		btnIn(3) <= '0';	
		wait for 300 ns;
		rst <= '0';
		btnIn(0) <= '0';
		btnIn(1) <= '0';
		btnIn(2) <= '1';
		btnIn(3) <= '0';	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
