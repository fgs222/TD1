----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:15:50 11/06/2019 
-- Design Name: 
-- Module Name:    myBlockMemTest - Behavioral 
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

entity myBlockMemTest is
port(clk: in std_logic;
	  rst: in std_logic;
	  wea: in std_logic_vector(0 downto 0);
	  addra: in std_logic_vector(9 downto 0);
	  dina: in std_logic_vector(15 downto 0);
	  douta: out std_logic_vector(15 downto 0);
	  web: in std_logic_vector(0 downto 0);
	  addrb: in std_logic_vector(9 downto 0);
	  dinb: in std_logic_vector(15 downto 0);
	  doutb: out std_logic_vector(15 downto 0));
end myBlockMemTest;

architecture Behavioral of myBlockMemTest is

COMPONENT blockRam
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

begin

BR: blockRam
port map(clka => clk,
			wea => wea,
			addra => addra,
			dina => dina,
			douta => douta,
			clkb => clk,
			web => web,
			addrb => addrb,
			dinb => dinb,
			doutb => doutb);

end Behavioral;

