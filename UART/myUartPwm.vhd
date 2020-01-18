----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:50:41 11/26/2019 
-- Design Name: 
-- Module Name:    myUartPwm - Behavioral 
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

entity myUartPwm is
port(clk: in std_logic;
	  rst: in std_logic;
	  tx: out std_logic;
	  rx: in std_logic;
	  led: out std_logic_vector(3 downto 0));
end myUartPwm;

architecture Behavioral of myUartPwm is

constant A: std_logic_vector := "01000001";

signal dataWr_s: std_logic;
signal dataTx_s: std_logic_vector(7 downto 0);
signal busy_s: std_logic;
signal dataRd_s: std_logic;
signal dataRx_s: std_logic_vector(7 downto 0);

type pwm_s is array (3 downto 0) of std_logic_vector(1 downto 0);

signal duty_s: pwm_s;
signal frec_s: pwm_s;
signal frecAux_s: pwm_s;
signal dutyAux_s: pwm_s;

signal load_s: std_logic_vector(3 downto 0);
signal loadAux_s: std_logic_vector(3 downto 0);

signal byte1_s: std_logic_vector(7 downto 0);
signal byte1Aux_s: std_logic_vector(7 downto 0);

type tState is (IDLE, STA, STD);

signal sNow: tState;
signal sNext: tState;

signal ledNow_s: std_logic_vector(1 downto 0);

begin

SEC: process(clk)
begin
	
	if rising_edge(clk) then
		if rst = '1' then
			sNow <= IDLE;
			byte1_s <= (others => '0');
			
			frec_s(0) <= "00";
			frec_s(1) <= "00";
			frec_s(2) <= "00";
			frec_s(3) <= "00";
			
			duty_s(0) <= "01";
			duty_s(1) <= "01";
			duty_s(2) <= "01";
			duty_s(3) <= "01";
			
			load_s <= "0000";
		else
			sNow <= sNext;
			byte1_s <= byte1Aux_s;
			
			frec_s(0) <= frecAux_s(0);
			frec_s(1) <= frecAux_s(1);
			frec_s(2) <= frecAux_s(2);
			frec_s(3) <= frecAux_s(3);
				
			duty_s(0) <= dutyAux_s(0);
			duty_s(1) <= dutyAux_s(1);
			duty_s(2) <= dutyAux_s(2);
			duty_s(3) <= dutyAux_s(3);
			
			load_s <= loadAux_s;
		end if;
	end if;
end process;

LC: process(sNow, dataRx_s, byte1_s, frec_s, duty_s, load_s, ledNow_s)
begin

	sNext <= sNow;
	dataTx_s <= "00000000";
	byte1Aux_s <= byte1_s;
	ledNow_s <= byte1_s(7 downto 6);
	
	dutyAux_s(0) <= duty_s(0);
	dutyAux_s(1) <= duty_s(1);
	dutyAux_s(2) <= duty_s(2);
	dutyAux_s(3) <= duty_s(3);
	
	frecAux_s(0) <= frec_s(0);
	frecAux_s(1) <= frec_s(1);
	frecAux_s(2) <= frec_s(2);
	frecAux_s(3) <= frec_s(3);
	
	loadAux_s <= "0000";		--Preferible que cargue por unica vez
	
	case sNow is
		when IDLE =>
			dataWr_s <= '0';
				
			if dataRx_s = A then
				dataTx_s <= A;
				dataWr_s <= '1';
				sNext <= STA;
			
			else
				sNext <= IDLE;
			end if;
				
		when STA =>
			dataWr_s <= '0';
			--Aca hay bardo	
			if dataRx_s /= A then
				byte1Aux_s <= dataRx_s;		--Se pone en 0 cuando pasa al proximo estado.
				dataTx_s <= byte1_s;
				dataWr_s <= '1';
				sNext <= STD;
			else
				sNext <= STA;
			end if;
		
		when STD =>
				
			dataWr_s <= '0';
			ledNow_s <= byte1_s(7 downto 6);
			
			case ledNow_s is
				
				when "00" =>
					frecAux_s(0) <= byte1_s(5 downto 4);
					dutyAux_s(0) <= byte1_s(1 downto 0);
					loadAux_s <= "0001";
				
				when "01" =>
					frecAux_s(1) <= byte1_s(5 downto 4);
					dutyAux_s(1) <= byte1_s(1 downto 0);
					loadAux_s <= "0010";
					
				when "10" =>
					frecAux_s(2) <= byte1_s(5 downto 4);
					dutyAux_s(2) <= byte1_s(1 downto 0);
					loadAux_s <= "0100";
					
				when "11" =>
					frecAux_s(3) <= byte1_s(5 downto 4);
					dutyAux_s(3) <= byte1_s(1 downto 0);
					loadAux_s <= "1000";
					
				when others =>
					dutyAux_s(0) <= "01";
					dutyAux_s(1) <= "01";
					dutyAux_s(2) <= "01";
					dutyAux_s(3) <= "01";
	
					frecAux_s(0) <= "00";
					frecAux_s(1) <= "00";
					frecAux_s(2) <= "00";
					frecAux_s(3) <= "00";
					
					loadAux_s <= "0000";
			end case;
		
			sNext <= IDLE;
			
		when others =>
			sNext <= IDLE;
		
	end case;
end process;

InstPWM: for i in 0 to 3 generate
	pwm: entity work.pwm(Arch_pwm)
	port map(clk => clk,
				rst => rst,
				duty => duty_s(i),
				frec => frec_s(i),
				pol => '0',
				load => load_s(i),
				salida => led(i));
end generate;

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

end Behavioral;

