----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:43:44 10/14/2019 
-- Design Name: 
-- Module Name:    lfsr_G - Behavioral 
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

entity lfsr_G is
generic(N: integer := 4);
port(clk: in std_logic;
	  rst: in std_logic;
	  taps: in std_logic_vector(N-1 downto 0);
	  salida: out std_logic_vector(N-1 downto 0));
end lfsr_G;

--	MODO DE USO TAP'S--
--Para usar taps hay que asginarlo como potencias de 2 
--por ejemplo si quiero poner una xor en el ff nº3
--taps<="1000";
--El numero del bit MSB del vector coincide con el numero mas grande de la cadena de FF's

architecture Arch_lfsr_G of lfsr_G is

signal ent_aux: std_logic_vector(N-1 downto 0);
signal n_aux: std_logic_vector(N-1 downto 0);
signal tap_aux: std_logic_vector(N-1 downto 0);
signal sal_aux: std_logic_vector(N-1 downto 0);

begin

instFor: for i in 0 to N-1 generate
	inst: entity work.lfsr_comp(Arch_lfsr_comp)
	port map(clk 	  => clk,
				rst 	  => rst, 
				entrada => ent_aux(i),
				n 		  => n_aux(i),
				tap 	  => taps(i),
				salida  => sal_aux(i));
end generate;

ent_aux(0) <= sal_aux(N-1);

f1: for i in 0 to N-2 generate
	ent_aux(i+1) <= sal_aux(i);
end generate;

f2: for i in 1 to N-1 generate
	n_aux(i) <= sal_aux(N-1);
end generate;

n_aux(0) <= '0';

salida <= sal_aux;

end Arch_lfsr_G;

