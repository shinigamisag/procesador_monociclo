library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexor is
    Port ( data : in  STD_LOGIC_VECTOR (31 downto 0);
           seuoperando : in  STD_LOGIC_VECTOR (31 downto 0);
           selimmediate : in  STD_LOGIC;
           operandoalu : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexor;

architecture arq_multiplexor of multiplexor is

begin

	process(data,seuoperando,selimmediate)
	begin
		if(selimmediate = '1')then
			operandoalu <= seuoperando;
		else
			if(selImmediate = '0')then
				operandoalu <= data;
			end if;
		end if;
	end process;

end arq_multiplexor;
