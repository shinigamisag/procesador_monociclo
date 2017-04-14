library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity unidad_de_control is
    Port ( 
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end unidad_de_control;

architecture arq_unidad_de_control of unidad_de_control is

begin
	
	process(op,op3)
	
	begin
		ALUOP <= "000000";
					if(op = "10")then				
						case op3 is
							when "000000" => -- suma
								
								ALUOP <= "000000";							
							when "000100"=> -- resta
								
								ALUOP <= "000100";							
							when "000001" => -- y
								
								ALUOP <= "000001";	
							when "000101" => --nand
								
								ALUOP <= "000101";
							when "000010" => -- o
								
								ALUOP <= "000010";
							when "000110" => -- nor
								
								ALUOP <= "000110";
							when "000011" => -- xor	
								
								ALUOP <= "000011";
							when "000111" => -- xnor
								
								ALUOP <= "000111";
								
							when others => -- otras instrucciones
								
								ALUOP <= "000000";
						end case;
					else
						ALUOP <= "000000";
						
					end if;
	
	end process;
end arq_unidad_de_control;
