----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:42:46 09/19/2019 
-- Design Name: 
-- Module Name:    conversorBinarioGray - Behavioral 
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

entity conversorBinarioGray is
generic(N: integer := 8);
port(entrada: in std_logic_vector(N-1 downto 0);
		salida: out std_logic_vector(N-1 downto 0);
		sel: in std_logic);
end conversorBinarioGray;

architecture Arch_conversorBinarioGray of conversorBinarioGray is

signal binGray: std_logic_vector(N-1 downto 0);
signal grayBin: std_logic_vector(N-1 downto 0);

begin


BG: entity work.binarioGray(Arch_binarioGray)
port map(binario => entrada,
			gray => binGray);

GB: entity WORK.grayBinario(ARCH_grayBinario)
	port MAP( gray    => entrada,
				 binario => GrayBin
				);
										
salida <= binGray when sel = '1' else
			 GrayBin;

end Arch_conversorBinarioGray;

