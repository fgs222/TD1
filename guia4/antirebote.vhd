----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:30:43 08/29/2019 
-- Design Name: 
-- Module Name:    antirebote - Behavioral 
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
use IEEE.STD_LOGIC_MISC.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity antirebote is
generic(N : integer := 4);
port(clk: in std_logic;
	  rst: in std_logic;
	  btnIn: in std_logic_vector(N-1 downto 0);
	  btnOut: out std_logic_vector(N-1 downto 0);
	  btnValid: out std_logic);
end antirebote;

architecture Arch_antirebote of antirebote is
 
signal btnIn_actual: std_logic_vector(N-1 downto 0);
signal btnIn_anterior: std_logic_vector(N-1 downto 0);
signal Valido: std_logic := '0';
signal counter_set: std_logic; 

begin

counter_set <= xor_reduce(btnIn_anterior) xor xor_reduce(btnIn_actual);
btnValid <= Valido;

process (clk,rst)
VARIABLE count: INTEGER RANGE 0 TO 10;  --Contador timing

begin

	if(rst = '1') then
		btnIn_actual <= (others => '0');
		btnOut <= (others => '0');
	elsif(rising_edge(clk)) then
		Valido <= '0';
		btnIn_actual <= btnIn;
		btnIn_anterior <= btnIn_actual; 
		if(counter_set = '1') then
			count := 0;   
      elsif(count < 10) then  
			count := count + 1;                            
      else                                           
			btnOut <= btnIn_anterior; 
			Valido <= '1';
		end if;
	end if;	
end process;

end Arch_antirebote;

