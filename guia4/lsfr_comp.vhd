----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:46:46 10/14/2019 
-- Design Name: 
-- Module Name:    lsfr_comp - Behavioral 
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

entity lfsr_comp is
port(clk: in std_logic;
	  rst: in std_logic;
	  entrada : in std_logic;
	  n : in std_logic;
	  tap : in std_logic;
	  salida : out std_logic);
end lfsr_comp;

architecture Arch_lfsr_comp of lfsr_comp is

signal q: std_logic;

begin

process (clk, rst)
begin
	if(rst = '1') then
		q <= '1';
	elsif(rising_edge(clk)) then
		if(tap = '1') then
			q <= n xor entrada;
		else
			q <= entrada;
		end if;
	end if;
end process;

salida <= q;

end Arch_lfsr_comp;

