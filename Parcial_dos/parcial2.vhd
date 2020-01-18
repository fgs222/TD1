----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:40:17 11/28/2019 
-- Design Name: 
-- Module Name:    parcial2 - Behavioral 
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

entity parcial2 is
generic(baudrate: integer := 9600;
		  sysclk: integer := 50000000);
port(clk: in std_logic;
	  rst: in std_logic;
	  rx: in std_logic;
	  tx: out std_logic);
end parcial2;

architecture Arch_parcial2 of parcial2 is

constant AA: std_logic_vector := "10101010";

-------------Signals UART---------------------
signal dataWr_s: std_logic;
signal dataTx_s: std_logic_vector(7 downto 0);
signal busy_s: std_logic;
signal dataRd_s: std_logic;
signal dataRx_s: std_logic_vector(7 downto 0);

-------------Signals LFSR---------------------
signal enL_s: std_logic;
signal enLAux_S: std_logic;
signal taps_s: std_logic_vector(7 downto 0);
signal tapsAux_s: std_logic_vector(7 downto 0);
signal salida_s: std_logic_vector(7 downto 0);
signal rst_s: std_logic;
signal rstAux_s: std_logic;

-------------Signals Cnt----------------------
signal enC_s: std_logic;
signal enCAux_s: std_logic;
signal sec_s: std_logic;

-------------Signal Estados-------------------
type tState is (IDLE, STA, STB);
signal sNow: tState;
signal sNext: tState;

begin

SEC: process(clk)
begin

	if rising_edge(clk) then
		if rst = '1' then
			sNow <= IDLE;
			taps_s <= "00000000";
			enC_s <= '0';
			enL_s <= '0';
			rst_s <= '1';
		else
			sNow <= sNext;
			taps_s <= tapsAux_s;
			enC_s <= enCAux_s;
			enL_s <= enLAux_s;
			rst_s <= rstAux_s;
		end if;
	end if;
end process;

LC: process(sNow, dataRx_s, taps_s, enC_s, enL_s, salida_s)
begin

	sNext <= sNow;
	tapsAux_s <= taps_s;
	enCAux_s <= enC_s;
	enLAux_s <= enL_s;
	dataTx_s <= "00000000";
	dataWr_s <= '0';
	rstAux_s <= rst_s;
	
	case sNow is
		
		when IDLE =>
			if dataRx_s = AA then			---Si llega X"AA"
				sNext <= STA;					---Paso al estado de espera de taps
			else
				sNext <= IDLE;					---Me quedo en este estado
			end if;
			
		when STA =>
			rstAux_s <= '0';					--Bajo reseteo LFSR
			if dataRx_s /= AA then			---Si llega el byte de taps
				tapsAux_s <= dataRx_s;		---Copio el byte recibidoa los taps
				dataWr_s <= '1';				---Activo la transmision							
				dataTx_s <= salida_s;		---Envio la salida del lfsr
				enCAux_s <= '1';				---Arranco el contador
				enLAux_s <= '1';				---Arranco el LFSR
											
				sNext <= STB;					---Paso al estado de la trasmision
			else
				sNext <= STA;					---Me quedo en este estado
			end if;
			
		when STB => 			
			
			enLAux_s <= '0';					---Desactivo el LFSR
			
			if sec_s = '1' then				---Si llega 1 segundo
				dataWr_s <= '1';				---Activo la transmision							
				dataTx_s <= salida_s;		---Envio la salida del lfsr
				enLAux_s <= '1';				---Arranco el LFSR
			elsif dataRx_s = AA then		--Si llegan datos nuevos
				rstAux_s <= '1';				--Reseteo el LFSR
				sNext <= STA;					--Voy al estado X"AA"
			else
				sNext <= STB;					--Me quedo en este estado
			end if;
			
		when others =>
			sNext <= IDLE;
	end case;
end process;

UART: entity work.myUart(Arch_myUart)
generic map(dataSize => 8)	
port map(clk => clk,
			rst => rst,
			dataWr => dataWr_s,
			dataTx => dataTx_s,
			busy => busy_s,
			tx => tx,		
			dataRd => dataRd_s,		
			dataRx => dataRx_s,		
			rx => rx);

LSFR: entity work.lfsr_F(Arch_lfsr_F)
generic map(N => 8)
port map(clk => clk,
			rst => rst_s,
			en => enL_s,
			taps => taps_s,
			salida => salida_s);
			
CNT: entity work.myCnt(Arch_myCnt)
generic map(M => 50000000)
port map(clk => clk,
			rst => rst,
			ena => enC_s,
			salidaM_2 => open,
			salidaM => sec_s);

end Arch_parcial2;

