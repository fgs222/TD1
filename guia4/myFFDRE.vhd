----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:56:58 08/29/2019 
-- Design Name: 
-- Module Name:    myFFDRE - Behavioral 
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

entity myFFDRE is
port(clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		d: in std_logic;
		q: out std_logic);
end myFFDRE;

architecture Arch_myFFDRE of myFFDRE is

begin

process(clk)
begin

	if rising_edge(clk) then
		if rst = '1' then
			q <= '0';
		elsif ena = '1' then
			q <= d;
		end if;
	end if;

end process;

end Arch_myFFDRE;

