--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:15:36 11/28/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/Parcial_dos/parcial2_tb.vhd
-- Project Name:  Parcial_dos
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: parcial2
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
 
ENTITY parcial2_tb IS
END parcial2_tb;
 
ARCHITECTURE behavior OF parcial2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT parcial2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         rx : IN  std_logic;
         tx : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal tx : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: parcial2 PORT MAP (
          clk => clk,
          rst => rst,
          rx => rx,
          tx => tx
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
		rst <= '1';
		wait for 100 ns;
      rst <= '0';	
		---BYTE 1 ---10101010
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '0';	---INICIO BYTE 1
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';	-----Bit STOP-----
		wait for 1 ms;
		---BYTE 2 ---11111111
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '1';	---INICIO BYTE 2
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';	-----Bit STOP-----
		wait for 1 ms;
		
		wait;
   end process;

END;
