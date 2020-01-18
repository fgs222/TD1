----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:41:28 08/29/2019 
-- Design Name: 
-- Module Name:    myRingCntBi - Behavioral 
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

entity myRingCntBi is
generic(N: integer := 4);
port(clk: in std_logic;
		rst: in std_logic;
		ena: in std_logic;
		dir: in std_logic;
		q: out std_logic_vector(N-1 downto 0));
end myRingCntBi;

architecture Arch_myRingCntBi of myRingCntBi is

signal qNext: std_logic_vector(N-1 downto 0);
signal qNow: std_logic_vector(N-1 downto 0);

begin

q <= qNow;

FFD0: entity work.myFFDSE(Arch_myFFDSE)
port map(clk => clk,
			set => rst,
			ena => ena,
			d => qNext(0),
			q => qNow(0));
			
SR: for i in 1 to N-1 generate
	FFDN: entity work.myFFDRE(Arch_myFFDRE)
	port map(clk => clk,
				rst => rst,
				ena => ena,
				d => qNext(i),
				q => qNow(i));
				
end generate;

QN: for i in 1 to N-2 generate
	qNext(i) <= qNow(i-1) when dir = '0' else
					qNow(i+1);

end generate;

qNext(0) <= qNow(N-1) when dir = '0' else
				qNow(1);
				
qNext(N-1) <= qNow(N-2) when dir = '0' else
					qNow(0);
	
end Arch_myRingCntBi;

