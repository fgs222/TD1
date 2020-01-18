----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:50:48 07/09/2019 
-- Design Name: 
-- Module Name:    paridadGen - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity paridadGen is
generic(N: integer := 4);
port( a: in std_logic_vector(N-1 downto 0);
		paridadSel: in std_logic;
		p: out std_logic);
end paridadGen;

architecture Arch_paridadGen of paridadGen is

--signal que almacena la paridad
signal s_par: std_logic;

begin

process(a)

variable temp: std_logic;
begin
	
	temp := a(0);
	
	for i in 1 to N-1 loop
		temp := temp xor a(i);
	end loop;
	
	s_par <= temp;
	
end process;

with paridadSel select
	p <=  s_par when '0',
			not s_par when others;

end Arch_paridadGen;

