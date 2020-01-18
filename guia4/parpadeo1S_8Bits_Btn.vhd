----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:34:46 10/03/2019 
-- Design Name: 
-- Module Name:    parpadeo1S_8Bits_Btn - Behavioral 
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
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parpadeo1S_8Bits_Btn is
generic(N: INTEGER := 8);
port( clk: in std_logic;
		rst: in std_logic;
		btn: in std_logic;
		led: out std_logic_vector(N-1 downto 0));
end parpadeo1S_8Bits_Btn;

architecture Arch_parpadeo1S_8Bits_Btn of parpadeo1S_8Bits_Btn is

signal auxS: std_logic;
signal btnOut_s: std_logic;
signal dir_s: std_logic := '0';

begin

process(btnOut_s)

begin

	if rising_edge(btnOut_s) then
		dir_s <= dir_s xor '1';
	end if;

end process;

BUT: entity work.antirebote_1p(Arch_antirebote_1p)
port map(clk => clk,
			rst => rst,
			btnIn => btn,
			btnOut => btnOut_s,
			btnValid => open);

FFT: entity WORK.myCnt(Arch_myCnt)
generic MAP(M => 10)						-- Para lograr 1s, se debe poner 10000000, pero no se ve en el TB sino
port MAP(clk => clk,
			rst => rst,
			ena => '1',
			salidaM_2 => open,
			salidaM => auxS);

CNT1: entity WORK.myRingCntBi(Arch_myRingCntBi)
generic MAP(N => 8)
port MAP(clk => clk,
			rst => rst,
			ena => auxS,
			dir => dir_s,
			q => led);

end Arch_parpadeo1S_8Bits_Btn;

