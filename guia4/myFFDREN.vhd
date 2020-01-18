----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:05:10 08/23/2019 
-- Design Name: 
-- Module Name:    myFFDREN - Behavioral 
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

entity myFFDREN is
generic(N: integer := 4);
port(clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		d: in std_logic_vector(N-1 downto 0);
		q: out std_logic_vector(N-1 downto 0));
end myFFDREN;

architecture Arch_myFFDREN of myFFDREN is

begin

process (clk)
begin

	if rising_edge(clk) then
			if rst = '1' then
				q <= (others=>'0');
			elsif  ena = '1' then 
				q <=  d ;
			end if;
		end if;

end process;

end Arch_myFFDREN;

