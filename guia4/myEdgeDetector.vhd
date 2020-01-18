----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:21:50 08/23/2019 
-- Design Name: 
-- Module Name:    myEdgeDetector - Behavioral 
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

entity myEdgeDetector is
port(clk: in std_logic;
		rst: in std_logic;
		d: in std_logic;
		ascendente: out std_logic;
		descendente: out std_logic);
end myEdgeDetector;

architecture Arch_myEdgeDetector of myEdgeDetector is

signal qdSignal: std_logic_vector(2-1 downto 0);

begin

FFD: entity work.myFFDR(Arch_myFFDR)
port map(clk => clk,
			rst => rst,
			d => d,
			q => qdSignal(1));

qdSignal(0) <= d;
ascendente <= '1' when qdSignal = "01" else
					'0';
					
descendente <= '1' when qdSignal = "10" else
					'0';

end Arch_myEdgeDetector;

