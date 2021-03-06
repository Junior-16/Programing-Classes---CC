library IEEE;
use IEEE.std_logic_1164.all;

library IEEE;
use IEEE.std_logic_1164.all;

entity bcd_2_7segment is
    port (
			i0 : in std_logic;
			i1 : in std_logic;
			i2 : in std_logic;
			i3 : in std_logic;
			o0 : out std_logic;
			o1 : out std_logic;
			o2 : out std_logic;
			o3 : out std_logic;
			o4 : out std_logic;
			o5 : out std_logic;
			o6 : out std_logic		
	 );
end bcd_2_7segment;

architecture behavior of bcd_2_7segment is
	signal input : std_logic_vector(3 downto 0);
	signal output : std_logic_vector(6 downto 0);
	
begin

	input(0) <= i0; input(1) <= i1;
	input(2) <= i2; input(3) <= i3;
	
	with input select
   --       a  
	--      ---
	--    f|   | b
	--      ---
	--    e| g | c
	--      ---
	--       d      abcdefg
		output <= 	"1111110" when "0000", 
						"0110000" when "0001", 
						"1101101" when "0010", 
						"1111001" when "0011", 
						"0110011" when "0100", 
						"1011011" when "0101", 
						"1011111" when "0110", 
						"1110000" when "0111", 	
						"1111111" when "1000", 
						"1111011" when "1001", 
						"1110111" when "1010", 
						"0011111" when "1011", 
						"1001111" when "1100", 
						"0111101" when "1101", 
						"1001111" when "1110",
						"1011111" when others;
						
		o0 <= not(output(0)); o1 <= not(output(1));
	   o2 <= not(output(2)); o3 <= not(output(3));
		o4 <= not(output(4)); o5 <= not(output(5));
		o6 <= not(output(6));
		 		
end behavior;