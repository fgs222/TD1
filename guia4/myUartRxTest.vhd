----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:11:11 11/20/2019 
-- Design Name: 
-- Module Name:    myUartRxTest - Behavioral 
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

entity myUartRxTest is
port(clk: in std_logic;
	  rst: in std_logic;
	  led: out std_logic_vector(7 downto 0);
	  rx: in std_logic);
end myUartRxTest;

architecture Behavioral of myUartRxTest is

signal dataRd_s: std_logic;
signal dataRx_s: std_logic_vector(7 downto 0);
signal ledNow_s: std_logic_vector(7 downto 0);
signal ledNext_s: std_logic_vector(7 downto 0);
signal nRst_s: std_logic;

begin

led <= ledNow_s;
nRst_s <= rst;		--para simulacion en pc borrar el not

SEC: process(clk)
begin
	
	if rising_edge(clk) then
		if nRst_s = '1' then
			ledNow_s <= (others => '0');
		else
			ledNow_s <= ledNext_s;
		end if;
	end if;
end process;

LC: process(ledNow_s, dataRx_s, dataRd_s)
begin

	ledNext_s <= ledNow_s;
	
	if dataRd_s = '1' then
		ledNext_s <= dataRx_s;
	end if;
end process;

RXC: entity work.myUartRx(Arch_myUartRx)
generic map(baudRate => 9600,
		  sysClk => 100000000,
		  dataSize => 8)
port map(clk => clk,
			rst => nRst_s,
			rx => rx,
			dataRx => dataRx_s,
			dataRd => dataRd_s);

end Behavioral;

