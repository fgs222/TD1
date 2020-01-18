----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:44:14 10/03/2019 
-- Design Name: 
-- Module Name:    pwm - Behavioral 
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
use IEEE.MATH_REAL.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm is
generic(F: integer := 50000000); --Frecuencia clk en Hz
port( clk: in std_logic;
		rst: in std_logic;
		duty: in std_logic_vector(1 downto 0);
		frec: in std_logic_vector(1 downto 0);
		pol: in std_logic;
		load: in std_logic;
		salida: out std_logic);
end pwm;

architecture Arch_pwm of pwm is

constant frec_50: integer := F/50;
constant frec_80: integer := F/80;
constant frec_100: integer := F/100;
constant frec_125: integer := F/125;
constant N: integer := integer(ceil(log2(real(frec_50))));

signal frec_s: unsigned(N-1 downto 0); 
signal frecAux_s: unsigned(N-1 downto 0);
signal count_s: unsigned(N-1 downto 0);
signal cicleNowAux_s: unsigned(N-1 downto 0);

signal cicleNow_s: unsigned(N-1 downto 0);
signal duty_25_s: unsigned(N-1 downto 0);
signal duty_50_s: unsigned(N-1 downto 0);
signal duty_75_s: unsigned(N-1 downto 0);

signal counterOut_s: std_logic;
signal nOut_s: std_logic;
signal polNext_s: std_logic;

begin

--	Duty = 100*(t_high/F)

with frec select
	frec_s <= to_unsigned(frec_50, N) when "00",
					  to_unsigned(frec_80, N) when "01",
					  to_unsigned(frec_100, N) when "10",
					  to_unsigned(frec_125, N) when "11",
					  to_unsigned(frec_50, N) when others;

duty_25_s <= "00" & frec_s(N-1 downto 2);
duty_50_s <= '0' & frec_s(N-1 downto 1);
duty_75_s <= duty_25_s + duty_50_s;
					  
with duty select
	cicleNow_s <= duty_25_s when "00",
					  duty_50_s when "01",
					  duty_75_s when "10",
					  frec_s when "11",
					  duty_50_s when others;
					 
nOut_s <= not counterOut_s;

with polNext_s select
	salida <= counterOut_s when '0',
				 nOut_s when '1',
				 counterOut_s when others;

process(clk)
begin

	if rising_edge(clk) then
		if rst = '1' then
			count_s <= (others => '0');
			counterOut_s <= '1';
			frecAux_s <= to_unsigned(frec_50, N);
			cicleNowAux_s <= duty_50_s;
			polNext_s <= '0';
		else
			if load = '1' then
				frecAux_s <= frec_s;
				cicleNowAux_s <= cicleNow_s;
				counterOut_s <= '1';
				polNext_s <= pol;
				count_s <= (others => '0');
			elsif (count_s = frecAux_s) then
				counterOut_s <= '1';
				count_s <= count_s + 1;
				count_s <= (others => '0');
			elsif (count_s = cicleNowAux_s) then
				counterOut_s <= '0';
				count_s <= count_s + 1;
			else
				count_s <= count_s + 1;
			end if;
		end if;
	end if;
end process;

end Arch_pwm;

