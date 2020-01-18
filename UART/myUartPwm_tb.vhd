--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:04:14 11/28/2019
-- Design Name:   
-- Module Name:   C:/Users/franc/Desktop/Digitales1/Atencio/fstahl/UART/myUartPwm_tb.vhd
-- Project Name:  UART
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myUartPwm
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
--STA 1 en 0.989 ms
--STD 1 en 2.925765 ms
--IDLE 1 en 2,925775 ms 
--STA 2 en 6,797 ms
--RST en 8,160 ms
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY myUartPwm_tb IS
END myUartPwm_tb;
 
ARCHITECTURE behavior OF myUartPwm_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myUartPwm
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         tx : OUT  std_logic;
         rx : IN  std_logic;
         led : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rx : std_logic := '0';

 	--Outputs
   signal tx : std_logic;
   signal led : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myUartPwm PORT MAP (
          clk => clk,
          rst => rst,
          tx => tx,
          rx => rx,
          led => led
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
      wait for 200 ns;
		rst <= '0';	
		---BYTE 1 ---01000001
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '1';---INICIO BYTE 1
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';	-----Bit STOP-----
		wait for 1 ms;
		---BYTE 2---11100001
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '0';---INICIO BYTE 2
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';	-----Bit STOP------
		wait for 1ms;
		---BYTE 3---01110011---No deberia enviar
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '0';---INICIO BYTE 3
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';	-----Bit STOP------
		wait for 1ms;
		----BYTE 4----01000001
		rx <= '0';
		wait for 104 us;
		rx <= '1';---INICIO BYTE 4
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rx <= '1';	-----Bit STOP-----
		wait for 1 ms;
		---Byte 5---00110011--- Rst durante rx
		rx <= '0';	-----Bit START-----
		wait for 104 us;
		rx <= '0';---INICIO BYTE 3
		wait for 104 us;
		rx <= '1';
		wait for 104 us;
		rx <= '0';
		wait for 104 us;
		rst <= '1';
		wait for 104 us;
		rst <= '0';
		wait for 1ms;
      wait;
   end process;

END;
