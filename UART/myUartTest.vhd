----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:48 11/20/2019 
-- Design Name: 
-- Module Name:    myUartTest - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myUartTest is
port(clk: in std_logic;
     rst: in std_logic;
     sw: in std_logic_vector(3 downto 0);
     tx: out std_logic;
     led: out std_logic_vector(7 downto 0);
     rx: in std_logic);
end myUartTest;

architecture Arch_myUartTest of myUartTest is

signal dataRd_s: std_logic;
signal dataRx_s: std_logic_vector(7 downto 0);

signal busy_s: std_logic;
signal dataWr_s: std_logic;
signal dataTxNow_s: std_logic_vector(7 downto 0);
signal dataTxNext_s: std_logic_vector(7 downto 0);
	
signal data_s: std_logic_vector(7 downto 0);

begin

data_s <= sw & "0101";	
	
SEC: process( clk )
begin
	if rising_edge(clk) then
		if rst = '1' then
			led <= (others => '0');
			dataTxNow_s <= "00000000";
		elsif dataRd_s = '1' then
			led <= dataRx_s;
		else
			dataTxNow_s <= dataTxNext_s;
		end if;
	end if;
end process;

LC: process(dataTxNow_s, busy_s, sw, data_s)
begin
	if busy_s = '1' then
		dataTxNext_s <= data_s;
		dataWr_s	<= '1';
	else
		dataTxNext_s <= dataTxNow_s;
		dataWr_s <= '0';
	end if;
end process;

UART: entity work.myUart(Arch_myUart)
generic map(dataSize => 8)	
port map(clk => clk,
			rst => rst,
			dataWr => dataWr_s,
			dataTx => dataTxNow_s,
			busy => busy_s,
			tx => tx,		
			dataRd => dataRd_s,		
			dataRx => dataRx_s,		
			rx => rx);
				
end Arch_myUartTest;

