----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:44 10/18/2019 
-- Design Name: 
-- Module Name:    myUartTx - Behavioral 
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

entity myUartTx is
generic(baudRate: integer := 9600;
		  sysClk: integer := 100000000;
		  dataSize: integer := 8);
port(clk: in std_logic;
	  rst: in std_logic;
	  dataWr: in std_logic;
	  dataTx: in std_logic_vector(dataSize-1 downto 0);
	  busy: out std_logic;
	  tx: out std_logic);
end myUartTx;

architecture Arch_myUartTx of myUartTx is

type Tstate is (IDLE, TX0, TX1, TX2, TX3, TX4, TX5, TX6, TX7, STOP, START);

constant BIT_IDLE: std_logic := '1';
constant BIT_START: std_logic := '0';
constant BIT_STOP: std_logic := '1';

signal sNext, sNow: Tstate;
signal sRegDataNow: std_logic_vector(dataSize-1 downto 0);
signal sRegDataNext: std_logic_vector(dataSize-1 downto 0);
signal sTx: std_logic;
signal pulso104: std_logic;
signal rstDivFrec: std_logic;

begin

sec: process(clk)
begin
	if rising_edge(clk) then
		tx <= sTx;
		if rst = '1' then
			sNow <= IDLE;
			tx <= BIT_IDLE;
		else
			sNow <= sNext;
			sRegDataNow <= sRegDataNext;
		end if;
	end if;
end process;

LC: process(sNow, dataWr, pulso104, sRegDataNow, dataTx)
begin
	rstDivFrec <= '0';
	busy <= '1';
	sTx <= BIT_IDLE;
	sRegDataNext <= sRegDataNow;
	sNext <=sNow;
	
	case sNow is
		when IDLE =>
			busy <= '0';
			if dataWr = '1' then
				busy <= '1';
				sNext <= START;
				sRegDataNext <= dataTx;
				rstDivFrec <= '1';
				sTx <= BIT_START;
			end if;
			
		when START =>
			sTx <= BIT_START;
			if pulso104 = '1' then
				sNext <= TX0;
				sTx <= sRegDataNow(0);
			end if;
			
		when TX0 =>
			sTx <= sRegDataNow(0);
			if pulso104 = '1' then
				sNext <= TX1;
				sTx <= sRegDataNow(1);
			end if;
			
		when TX1 =>
			sTx <= sRegDataNow(1);
			if pulso104 = '1' then
				sNext <= TX2;
				sTx <= sRegDataNow(2);
			end if;
	
		when TX2 =>
			sTx <= sRegDataNow(2);
			if pulso104 = '1' then
				sNext <= TX3;
				sTx <= sRegDataNow(3);
			end if;
			
		when TX3 =>
			sTx <= sRegDataNow(3);
			if pulso104 = '1' then
				sNext <= TX4;
				sTx <= sRegDataNow(4);
			end if;
		
		when TX4 =>
			sTx <= sRegDataNow(4);
			if pulso104 = '1' then
				sNext <= TX5;
				sTx <= sRegDataNow(5);
			end if;
			
		when TX5 =>
			sTx <= sRegDataNow(5);
			if pulso104 = '1' then
				sNext <= TX6;
				sTx <= sRegDataNow(6);
			end if;
			
		when TX6 =>
			sTx <= sRegDataNow(6);
			if pulso104 = '1' then
				sNext <= TX7;
				sTx <= sRegDataNow(7);
			end if;
			
		when TX7 =>
			sTx <= sRegDataNow(7);
			if pulso104 = '1' then
				sNext <= STOP;
				sTx <= BIT_STOP;
			end if;
			
		when STOP =>
			sTx <= BIT_STOP;
			if pulso104 = '1' then
				sNext <= IDLE;
				sTx <= BIT_IDLE;
			end if;
		
		when others =>
			sNext <= IDLE;
		
	end case;
end process;

cont: entity work.myCnt(Arch_myCnt)
generic map(M => sysClk/baudRate)
port map(clk => clk,
			rst => rstDivFrec,
			ena => '1',
			salidaM_2 => OPEN,
			salidaM => pulso104);

end Arch_myUartTx;

