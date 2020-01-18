----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:52:08 09/18/2019 
-- Design Name: 
-- Module Name:    grayBinario - Behavioral 
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

entity grayBinario is
generic(N: integer := 8);
port(gray: in std_logic_vector(N-1 downto 0);
		binario: out std_logic_vector(N-1 downto 0));
end grayBinario;

architecture Arch_grayBinario of grayBinario is

signal bin: std_logic_vector (N-1 downto 0);

begin

binario <= bin;
bin(N-1) <= gray(N-1);

GB: for i in 0 to N-2 generate
bin(i) <= gray(i) Xor bin(i+1);
end generate;

end Arch_grayBinario;

