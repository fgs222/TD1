----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:14 09/26/2019 
-- Design Name: 
-- Module Name:    myCntBi - Behavioral 
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

entity myCntBi is
generic(N: integer := 8);
port(clk: in std_logic;
	  ena: in std_logic;
	  rst: in std_logic;
	  q: out std_logic_vector(N-1 downto 0));
end myCntBi;

architecture Arch_myCntBi of myCntBi is

signal qNow: unsigned(N-1 downto 0);
signal qNext: unsigned(N-1 downto 0);

begin

process(clk)
begin

	if rising_edge(clk) then
		if rst = '1' then
			qNow <= to_unsigned(0, N);
		else
			qNow <= qNext;
		end if;
	end if;
	
end process;

qNext <= (qNow+1) when ena = '1' else
				qnow;
				
q <= std_logic_vector(qNext);


end Arch_myCntBi;

