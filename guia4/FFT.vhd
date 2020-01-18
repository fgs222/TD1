----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:58:39 08/22/2019 
-- Design Name: 
-- Module Name:    FFT - Behavioral 
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

entity FFT is
port(clk: in std_logic;
		rst: in std_logic;
		t: in std_logic;
		q: out std_logic);
end FFT;

architecture Arch_FFT of FFT is

signal q_s: std_logic;			--signal de la salida

begin

q <= q_s;

process(clk)
begin
	if(rising_edge(clk)) then
		if(rst = '1') then
			q_s <= '0';
		else
			q_s <= t xor q_s;
		end if;
	end if;
end process;

end Arch_FFT;

