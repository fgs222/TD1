----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:45 08/08/2019 
-- Design Name: 
-- Module Name:    sumadorRestador - Behavioral 
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

entity sumadorRestador is
generic (N: integer := 4);
port(a: in std_logic_vector (N-1 downto 0);
		b: in std_logic_vector (N-1 downto 0);
		s_r: in std_logic;
		ov: out std_logic;
		resultado: out std_logic_vector (N-1 downto 0));
end sumadorRestador;

architecture Behavioral of sumadorRestador is

signal siga_s, sigb_s: signed(N-1 downto 0); 				--signal de las entradas signadas
signal res_s: signed(N-1 downto 0);								--signal del resultado signado de la operacion de las entradas
signal ov_s: std_logic;												--signal del overflow de la suma
signal ov_r: std_logic;												--signal del overflow de la resta
signal satmax, satmin: std_logic_vector(N-1 downto 0);	--signal de los valores signados de saturacion max y min


begin

siga_s <= signed(a);
sigb_s <= signed(b);

with s_r select
	res_s <= siga_s + sigb_s when '0',
				siga_s - sigb_s when others;

ov_s <= '1' when ((siga_s(N-1) = '0') and (sigb_s(N-1) = '0') and (s_r = '0') and (res_s(N-1) = '1')) else
		  '1' when ((siga_s(N-1) = '1') and (sigb_s(N-1) = '1') and (s_r = '0') and (res_s(N-1) = '0')) else
		  '0';
	
ov_r <= '1' when ((siga_s(N-1) = '0') and (sigb_s(N-1) = '1') and (s_r = '1') and (res_s(N-1) = '1')) else
		  '1' when ((siga_s(N-1) = '1') and (sigb_s(N-1) = '0') and (s_r = '1') and (res_s(N-1) = '0')) else
		  '0';

satmax(N-1) <= '0'; satmax(N-2 downto 0) <= (others => '1');
satmin(N-1) <= '1'; satmin(N-2 downto 0) <= (others => '0');
	
resultado <= std_logic_vector(res_s) when (ov_s = '0' and ov_r = '0') else
			    satmax when (s_r = '0' and ov_s = '1') else
			    satmin when (s_r = '1' and ov_r = '1');
			
ov <= ov_s or ov_r;
			
end Behavioral;

