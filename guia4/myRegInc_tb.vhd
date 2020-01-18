--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:27:51 09/05/2019
-- Design Name:   
-- Module Name:   C:/Users/Fran/Desktop/UTN/3ro/Digitales1/Atencio/Guia 4_1/myRegInc_tb.vhd
-- Project Name:  guia4_1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myRegInc
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
 
ENTITY myRegInc_tb IS
END myRegInc_tb;
 
ARCHITECTURE behavior OF myRegInc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myRegInc
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         dataUp : IN  std_logic;
         dataDown : IN  std_logic;
         regOut : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal dataUp : std_logic := '0';
   signal dataDown : std_logic := '0';

 	--Outputs
   signal regOut : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myRegInc PORT MAP (
          clk => clk,
          rst => rst,
          dataUp => dataUp,
          dataDown => dataDown,
          regOut => regOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   stim_proc: process
   begin
		rst <= '1';
		wait for clk_period;
		rst <= '0';
		wait for clk_period;
		dataUp <= '1'; dataDown <= '0';
		wait for clk_period;
		dataUp <= '1'; dataDown <= '0';
		wait for clk_period;
		dataDown<= '1'; dataUp <= '0';
		wait for clk_period;
		dataDown <= '1'; dataUp <= '0';
		wait for clk_period;
		wait;
   end process;

END;
