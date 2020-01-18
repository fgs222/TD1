----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:59:04 11/20/2019 
-- Design Name: 
-- Module Name:    myUart - Behavioral 
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

entity myUart is
generic(baudRate: integer := 9600;
		  sysClk: 	integer := 100000000;
		  dataSize: integer := 8);
port(clk: in std_logic;
	  rst: in std_logic;
	  dataWr: in std_logic;
	  dataTx: in std_logic_vector(dataSize-1 downto 0);
	  busy: out std_logic;
	  tx: out std_logic;
	  dataRd: out std_logic;
	  dataRx: out std_logic_vector(dataSize-1 downto 0);
	  rx: in std_logic);
end myUart;

architecture Behavioral of myUart is

begin

TX1: entity work.myUartTx(Arch_myUartTx)
generic map(baudRate	=> baudRate,
				sysClk => sysClk,
				dataSize	=> dataSize)	
port map(clk => clk,
			rst => rst,
			dataWr => dataWr,
			dataTx => dataTx,
			busy => busy,
			tx => tx);
			
RX1: entity work.myUartRx(Arch_myUartRx)
generic map(baudRate	=> baudRate,
				sysClk => sysClk,
				dataSize	=> dataSize)	
port map(clk => clk,
			rst => rst,
			dataRd => dataRd,				 
			dataRx => dataRx,				
			rx => rx);

end Behavioral;

