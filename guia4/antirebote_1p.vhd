----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:31 11/15/2019 
-- Design Name: 
-- Module Name:    antirebote_1p - Behavioral 
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

entity antirebote_1p is
port(	clk: in std_logic;
		rst: in std_logic;
		btnIn: in std_logic;
		btnOut: out std_logic;
		btnValid: out std_logic);
end antirebote_1p;

architecture Arch_antirebote_1p of antirebote_1p is

type state_T is (stA, stB, stC);
signal stateNow, stateNext: state_T;
signal ready: std_logic;

begin

estado: process(clk)

begin

	if rising_edge(clk) then
		if rst = '1' then
			stateNow <= stA;
		else
			stateNow <= stateNext;
		end if;
	end if;
end process;

logicadesalida: process(stateNow, btnIn, ready)

begin
	
	btnOut <= '0';
	btnValid <= '0';
	stateNext <= stateNow;
	
	case(stateNow) is
		when stA =>
			if btnIn = '1' then
				stateNext <= stB;
			else
				stateNext <= stA;
			end if;
	
		when stB =>
			if ready = '1' then
				stateNext <= stC;
			else
				stateNext <= stB;
			end if;
			
		when stC =>
			if btnIn = '1' then
				btnOut <= '1';
				btnValid <= '1';
			else
				stateNext <= stA;
			end if;
			
			when others =>
				stateNext <= stA;
	end case;
end process;

FFT: entity work.myCnt(Arch_myCnt)
generic MAP(M => 5)						-- Para lograr 50ms, se debe poner 500000, pero no se ve en el TB sino
port MAP(clk => clk,
			rst => rst,
			ena => '1',
			salidaM_2 => open,
			salidaM => ready);	

end Arch_antirebote_1p;

