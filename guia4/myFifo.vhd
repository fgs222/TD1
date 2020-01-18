----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:11 11/06/2019 
-- Design Name: 
-- Module Name:    myFifo - Behavioral 
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

entity myFifo is
port(clk: in std_logic;
	  rst: in std_logic;
	  din: in std_logic_vector(7 downto 0);
	  wrEna: in std_logic;
	  dout: out std_logic_vector(7 downto 0);
	  rdEna: in std_logic;
	  full: out std_logic;
	  mid: out std_logic;
	  empty: out std_logic);
end myFifo;

architecture Behavioral of myFifo is

COMPONENT blockRam_1024_8bits
  PORT (
    clka : IN STD_LOGIC;
    rsta : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;

COMPONENT myRegInc is
generic(N: integer := 10);
port(clk: in std_logic;
	  rst: in std_logic;
	  dataUp: in std_logic;
	  dataDown: in std_logic;
	  regOut: out std_logic_vector(N-1 downto 0));
end component;

signal addra_blkmem: std_logic_vector(9 downto 0);
signal read_write: std_logic;

begin

BR : blockRam_1024_8bits
PORT MAP(clka => clk,
			rsta => rst,
			wea(0) => wrEna,
			addra => addra_blkmem,
			dina => din,
			douta => dout);

RI: myRegInc
port map(clk => clk,
			rst => rst,
			dataUp => read_write,
			dataDown => '0',
			regOut => addra_blkmem);
			
read_write <= wrEna or rdEna;

with addra_BLKMEM select
	full <= '1' when "1111111111",
			  '0' when others;
			 
with addra_blkmem select
	empty <= '1' when "0000000000",
			   '0' when others;
		
with addra_blkmem select
	mid <= '1' when "1000000000",
			 '0' when others;

end Behavioral;

