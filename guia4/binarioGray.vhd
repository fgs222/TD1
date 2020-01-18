----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:35:09 09/19/2019 
-- Design Name: 
-- Module Name:    binarioGray - Behavioral 
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

entity binarioGray is
generic(N: integer := 8);
port(binario: in std_Logic_vector(N-1 downto 0);
		gray: out std_logic_vector(N-1 downto 0));
end binarioGray;

architecture Arch_binarioGray of binarioGray is

begin

gray <= binario xor '0' & binario(N-1 downto 1);

end Arch_binarioGray;

