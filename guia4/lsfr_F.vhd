----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:28 10/14/2019 
-- Design Name: 
-- Module Name:    lsfr_F - Behavioral 
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

entity lfsr_F is
generic(N: integer := 4);
port(clk: in std_logic;
	  rst: in std_logic;
	  taps: in std_logic_vector(N-1 downto 0);
	  salida: out std_logic_vector(N-1 downto 0));
end;

architecture Arch_lfsr_F of lfsr_F is

signal qNow, qNext: std_logic_vector(N-1 downto 0);
signal parity_aux: std_logic;

--		MODO DE USO TAPS	--
--taps<=" 0     0   1    0";
--			 |     |   |    |
--			s/u  tap3 tap2 tap1
--		MODO DE USO TAPS	--

begin

parityGen: entity work.paridadGen(Arch_paridadGen)
	generic map(N => N)
	port map(a => qNext,
				paridadSel => '0',
				p => parity_aux);
									 								 
for_taps: for k in 0 to N-2 generate
	with taps(k) select
		qNext(k) <= qNow(k) when '1',
						'0'  when others;
end generate;

qNext(N-1) <= qNow(N-1);

process(clk,rst)
begin
	if(rising_edge(clk)) then
		if(rst = '1') then
			qNow <= (others => '1');
		else
			qNow <= qNow(N-2 downto 0) & parity_aux;
		end if;
	end if;
end process;

salida <= qNow;

end Arch_lfsr_F;