library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PSRModifier is
    Port ( rfToalu1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in std_logic;
           muxToalu : in  STD_LOGIC_vector (31 downto 0);
           aluop1 : in  STD_LOGIC_vector (5 downto 0);
           aluresultado : in  STD_LOGIC_VECTOR (31 downto 0);
			  NZVC : out std_logic_vector(3 downto 0));
end PSRModifier;

architecture Behavioral of PSRModifier is


begin

	process(rfToalu1,muxToalu,aluop1,aluresultado)
	begin				
		if(reset = '1')then
				NZVC <= (others=>'0');
		else
			case aluop1 is
		when "010000" =>--ADDCC
			NZVC(3) <= aluresultado(31);--n
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';--z
			else
				NZVC(2) <= '0';--z
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when "011000" => --ADDxCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		
		when "010100" => --subCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c

		when "011100" => --subxCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when "010001" => --andCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
			
		when "010010" => --orCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when "010110" => --ornCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when "010011" => --xorCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when "010111" => --xnorCC
			NZVC(3) <= aluresultado(31);
			if(aluresultado = X"00000000") then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (rfToalu1(31) and muxToalu(31) and (not aluresultado(31))) or ((rfToalu1(31) ) and (not muxToalu(31)) and aluresultado(31));--v
			NZVC(0) <= (rfToalu1(31) and muxToalu(31)) or ((not aluresultado(31)) and (rfToalu1(31) or muxToalu(31)));--c
		when others =>
			NZVC <= "0000";
	end case;
		end if;
	end process;

end Behavioral;