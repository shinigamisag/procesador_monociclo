library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port ( operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluOP : in  STD_LOGIC_VECTOR (5 downto 0);
           
           aluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture arq_alu of alu is

begin

	process(operando1,operando2,aluOP)
	begin
	   case (aluOP) is 
			when "000000" => -- suma
				AluResult <= operando1 + operando2;
			when "000100" => -- resta
				AluResult <= operando1 - operando2;
			when "000001" => --y
				AluResult <= operando1 and operando2;
			when "000101" => -- andn
				AluResult <= operando1 nand operando2;
			when "000010" => -- o
				AluResult <= operando1 or operando2;
			when "000110" => -- orn
				AluResult <= operando1 or operando2;
			when "000011" => -- xor
				AluResult <= operando1 xor operando2;
			when "000111" => -- xorn
				AluResult <= operando1 xnor operando2;
			when others => 
				AluResult <= (others=>'0');
		end case;
	end process;
end arq_alu;