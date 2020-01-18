--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:41:21 10/14/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/guia4/lsfr_F_tb.vhd
-- Project Name:  guia4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lfsr_F
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
 
ENTITY lsfr_F_tb IS
END lsfr_F_tb;
 
ARCHITECTURE behavior OF lsfr_F_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lfsr_F
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         taps : IN  std_logic_vector(3 downto 0);
         salida : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal taps : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lfsr_F PORT MAP (
          clk => clk,
          rst => rst,
          taps => taps,
          salida => salida
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
	
      wait for 100 ns;	
		rst <= '1';
		wait for 100 ns;	
		rst <= '0';
		wait for 100 ns;
		taps <= "0010";
		wait for clk_period*10;

      wait;
   end process;

END;
