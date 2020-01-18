----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:36:36 09/26/2019 
-- Design Name: 
-- Module Name:    myCntGray - Behavioral 
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
entity myCntGray is
generic(M: integer := 8); 
port(clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		salida: out std_logic_vector(M-1 downto 0));
end myCntGray;

architecture Arch_myCntGray of myCntGray is

signal salidaCnt: std_logic_vector(M-1 downto 0);

begin

CNT: entity work.myCntBi(Arch_myCntBi)
		generic map(N => M)
		port map(clk => clk,
					rst => rst,
					ena => ena,
					q => salidaCnt);
					
BG: entity work.binarioGray(Arch_binarioGray)
		generic map(N => M)
		port map(binario => salidaCnt,
					gray => salida);

end Arch_myCntGray;

