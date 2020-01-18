----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:38 08/23/2019 
-- Design Name: 
-- Module Name:    myEdgeCnt - Behavioral 
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

entity myEdgeCnt is
generic(N: integer := 4);
port(clk: in std_logic;
		rst: in std_logic;
		d: in std_logic;
		q: out std_logic_vector(N-1 downto 0));
end myEdgeCnt;

architecture Arch_myEdgeCnt of myEdgeCnt is

signal flanco: std_logic;
signal aux: std_logic;

begin

Detector: entity work.myEdgeDetector(Arch_myEdgeDetector)
port map(clk => clk,
			rst => rst,
			d => d,
			ascendente => flanco,
			descendente => aux);



end Arch_myEdgeCnt;

