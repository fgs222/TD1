----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:06:25 10/27/2019 
-- Design Name: 
-- Module Name:    myUartRx - Behavioral 
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

entity myUartRx is
generic(baudRate: integer := 9600;
		  sysClk: 	integer := 100000000;
		  dataSize: integer := 8);
port(clk: 		in std_logic;
	  rst: 		in std_logic;
	  dataRd: 	out std_logic;
	  dataRx: 	out std_logic_vector(dataSize-1 downto 0);
	  rx: 		in std_logic);
end myUartRx;

architecture Arch_myUartRx of myUartRx is

type Tstate is (IDLE, RX0, RX1, RX2, RX3, RX4, RX5, RX6, RX7, STOP, START, DELAY);

constant BIT_IDLE: 	std_logic := '1';
constant BIT_START: 	std_logic := '1';
constant BIT_STOP: 	std_logic := '0';

signal sNow, Snext: Tstate;

-- Guardan el dato a medida que llega
signal sDataAuxNow: 	std_logic_vector(dataSize-1 downto 0);
signal sDataAuxNext: std_logic_vector(dataSize-1 downto 0);
-- Mantienen los datos que llegan correctamente, hasta que llega un nuevo dato correcto, dataRx toma su valor constantemente
signal sRegDataNow: 	std_logic_vector(dataSize-1 downto 0);	
signal sRegDataNext: std_logic_vector(dataSize-1 downto 0);

signal sDataRd: 		std_logic;
signal pulso104: 		std_logic;
signal pulso52: 		std_logic;
signal rstDivFrec: 	std_logic;

begin

SEC: process(clk)
begin

	if rising_edge(clk) then
		dataRx <= sRegDataNow;
		dataRd <= sDataRd;
		if rst = '1' then
			sNow <= IDLE;
			sRegDataNow <= (others => '0');
			sDataAuxNow <= (others => '0');
		else
			sNow <= sNext;
			sRegDataNow <= sRegDataNext;
			sDataAuxNow <= sDataAuxNext;
		end if;
	end if;
end process;

LC: process(sNow, pulso52, pulso104, sRegDataNow, sDataAuxNow, rx)
begin
	
	sNext <= sNow;
	sRegDataNext <= sRegDataNow;
	sDataAuxNext <= sDataAuxNow;
	
	rstDivFrec <= '0';
	sDataRd <= '0';
	
	case sNow is
		
		when IDLE =>
			if rx = '0' then
				sNext <= START;
				rstDivFrec <= '1';
			end if;

-- Me desplazo medio ciclo de bit para chequear todos los bits que llegan a la mitad
-- Reseteo el divisor de frecuencia
-- Aprovecho y vuelvo a chequear el bit de start
		
		when START =>
			if pulso52 = '1' then
				sNext <= IDLE;
				if rx = '0' then
					sNext <= RX0;
					rstDivFrec <= '1';
				end if;
			end if;
		
-- Despues de desplazarme lo leo comumente
		
		when RX0 =>
			if pulso104 = '1' then
				sDataAuxNext(0) <= rx;
				sNext <= RX1;
			end if;
		
		when RX1 =>
			if pulso104 = '1' then
				sDataAuxNext(1) <= rx;
				sNext <= RX2;
			end if;
		
		when RX2 =>
			if pulso104 = '1' then
				sDataAuxNext(2) <= rx;
				sNext <= RX3;
			end if;
		
		when RX3 =>
			if pulso104 = '1' then
				sDataAuxNext(3) <= rx;
				sNext <= RX4;
			end if;
		
		when RX4 =>
			if pulso104 = '1' then
				sDataAuxNext(4) <= rx;
				sNext <= RX5;
			end if;
		
		when RX5 =>
			if pulso104 = '1' then
				sDataAuxNext(5) <= rx;
				sNext <= RX6;
			end if;
		
		when RX6 =>
			if pulso104 = '1' then
				sDataAuxNext(6) <= rx;
				sNext <= RX7;
			end if;
		
		when RX7 =>
			if pulso104 = '1' then
				sDataAuxNext(7) <= rx;
				sNext <= STOP;
			end if;
		
		when STOP =>
			if pulso104 = '1' then
				if rx = '1' then
					sRegDataNext <= sDataAuxNow;
					sNext <= DELAY;
				else
					sNext <= IDLE;
				end if;
			end if;
		
		when DELAY =>
			if pulso52 = '1' then
				sDataRd <= '1';
				sNext <= IDLE;
			end if;
			
		when others =>
			sNext <= IDLE;
	
	end case;
end process;

CONT: entity work.myCnt(Arch_myCnt)
generic map(M => sysClk/baudRate)
port map(clk => clk,
			rst => rstDivFrec,
			ena => '1',
			salidaM_2 => pulso52,
			salidaM => pulso104);

end Arch_myUartRx;

