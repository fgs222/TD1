----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:26:26 08/29/2019 
-- Design Name: 
-- Module Name:    parpadeo1S_8Bits - Behavioral 
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

entity parpadeo1S_8Bits is
generic(N: integer := 8);
port( clk: in std_logic;
		rst: in std_logic;
		dir: in std_logic;
		led: out std_logic_vector(N-1 downto 0));
end parpadeo1S_8Bits;

architecture Arch_parpadeo1S_8Bits of parpadeo1S_8Bits is

signal auxS: std_logic;
signal aux2S: std_logic;

begin

FFT: entity work.myCnt(Arch_myCnt)
		generic map(M => 10000000)								-- Para lograr 1s, se debe poner 10000000, reducimos para TB
		port map(clk => clk,
					rst => rst,
					ena => '1',
					SalidaM_2 => auxS,
					SalidaM => aux2S);
					
CNT: entity work.myRingCntBi(Arch_myRingCntBi)
		generic map(N => 8)
		port map(clk => clk,
					rst => rst,
					ena => auxS,
					dir => dir,
					q => led);
					
end Arch_parpadeo1S_8Bits;

