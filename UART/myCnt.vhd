----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:28:42 08/23/2019 
-- Design Name: 
-- Module Name:    myCnt - Behavioral 
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

entity myCnt is
generic(M: integer := 10);
port(clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		salidaM_2: out std_logic;
		salidaM: out std_logic);
end myCnt;

architecture Arch_myCnt of myCnt is

constant N: integer := integer(ceil(log2(real(M))));

signal qNext: unsigned(N-1 downto 0);
signal qNow: unsigned(N-1 downto 0);

begin

	process(clk)
	begin
	
		if rising_edge(clk) then
			if rst = '1' then
				qNow <= to_unsigned(0,N);
			else
				qNow <= qNext;
				end if;
			end if;
	end process;

	qNext <= to_unsigned(0,N) when qNow = to_unsigned(M-1,N) else
				to_unsigned(0,N) when rst = '1' else
				qNow when ena = '0' else
				qNow+1;
				
	salidaM_2 <= '1' when qNow = (to_unsigned(M-1,N))/2 else
					'1' when qNow = to_unsigned(M,N)-1 else
					'0';
					
	salidaM <= '1' when qNow = to_unsigned(M,N)-1 else
					'0';

end Arch_myCnt;

