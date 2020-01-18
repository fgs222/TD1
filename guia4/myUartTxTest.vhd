----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:19:37 10/27/2019 
-- Design Name: 
-- Module Name:    myUartTxTest - Behavioral 
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
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity myUartTxTest is
port(clk: in std_logic;
	  rst: in std_logic;
	  btn: in std_logic;
	  tx: out std_logic);
end myUartTxTest;

architecture Arch_myUartTxTest of myUartTxTest is

constant dataSize: integer := 8;
constant counterEnd: integer := 100000000;

signal dataWr_s: std_logic;
signal data_s: unsigned(7 downto 0);
signal busy_s: std_logic;
signal btnOut_s: std_logic;
signal ready_s: std_logic;
signal nRst_s: std_logic;

begin

nRst_s <=  rst;		--para simulacion en pc borrar el not

process(clk)

variable counter: integer range 0 to counterEnd;

begin
	if rising_edge(clk) then
		if nRst_s = '1' then
			data_s <= "00000000";
			counter := 0;
			ready_s <= '0';
		elsif(btnOut_s = '1' or ready_s = '1') then
			ready_s <= '1';
			counter := counter + 1;
			dataWr_s <= '0';
			if counter = counterEnd then
				dataWr_s <= '1';
				counter := 0;
				data_s <= data_s + 1;
			end if;
		end if;
	end if;
end process;

TXC: entity work.myUartTx(Arch_myUartTx)
generic map(baudRate => 9600,
		  sysClk => 100000000,
		  dataSize => 8)
port map(clk => clk,
			rst => nRst_s,
			dataWr => dataWr_s,
			dataTx => std_logic_vector(data_s),
			busy => busy_s,
			tx => tx);

BTN_R: entity work.antirebote_1p(Arch_antirebote_1p)
port map(clk => clk,
			rst => nRst_s,
			btnIn => btn,
			btnOut => btnOut_s,
			btnValid => open);

end Arch_myUartTxTest;

