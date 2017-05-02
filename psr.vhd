library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity psr is
    Port ( CLK : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
           Carry : out  STD_LOGIC);
          
end psr;

architecture Behavioral of psr is

begin
process(CLK,Reset,NZVC)
	begin
		if(Reset = '1') then
			Carry <= '0'; 
		else
			if(rising_edge(CLK)) then
				Carry <= NZVC(0);
			end if;
		end if;
	end process;

end Behavioral;

