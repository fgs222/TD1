----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:25 08/22/2019 
-- Design Name: 
-- Module Name:    parpadeo1S - Behavioral 
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

entity parpadeo1S is
port(clk: in std_logic;
		rst: in std_logic;
		led: out std_logic);
end parpadeo1S;

architecture Arch_parpadeo1S of parpadeo1S is

signal aux1S, aux2S: std_logic;

begin

Contador: entity work.myCnt(Arch_myCnt)
generic map(M => 10000000)
port map(clk => clk,
			rst => rst,
			ena => '1',
			salidaM_2 => aux1S,
			salidaM => aux2S);

FFT: entity work.FFT(Arch_FFT)
port map(clk => clk,
			rst => rst,
			t => aux2S,
			q => led);


end Arch_parpadeo1S;

