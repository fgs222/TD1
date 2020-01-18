----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:55:34 08/08/2019 
-- Design Name: 
-- Module Name:    myDivMag8 - Behavioral 
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

entity myDivMag8 is
	port(entrada : in std_logic_vector (7 downto 0);
			div: in std_logic_vector (1 downto 0);
			salida: out std_logic_vector (7 downto 0));
end myDivMag8;

architecture Behavioral of myDivMag8 is

signal s_salida: unsigned (7 downto 0);
signal s_div: natural;

begin
	s_div <= to_integer(unsigned(div));
	s_salida <=	shift_right(unsigned(entrada), s_div);
	salida 	<= std_logic_vector(s_salida);

end Behavioral;

