----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:31:45 07/09/2019 
-- Design Name: 
-- Module Name:    myDeco7Seg - Behavioral 
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

entity myDeco7Seg is
port( entrada: in std_logic_vector (3 downto 0);
		a, b, c, d, e, f, g: out std_logic);
end myDeco7Seg;

architecture Behavioral of myDeco7Seg is

signal s_out: std_logic_vector (6 downto 0);

begin

with entrada select
	s_out <= "1111110" when "0000",
				"0110000" when "0001",
				"1101101" when "0010",
				"0111001" when "0011",
				"1110011" when "0100",
				"1011011" when "0101",
				"1011111" when "0110",
				"1110000" when "0111",
				"1111111" when "1000",
				"1111111" when "1001",
				"1110111" when "1010",
				"0011111" when "1011",
				"1001110" when "1100",
				"0111101" when "1101",
				"1001111" when "1110",
				"1000111" when others;
	
	a <= s_out(6);
	b <= s_out(5);
	c <= s_out(4);
	d <= s_out(3);
	e <= s_out(2);
	f <= s_out(1);
	g <= s_out(0);
	
end Behavioral;

