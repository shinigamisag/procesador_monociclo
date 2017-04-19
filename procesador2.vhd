library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity procesador2 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture arq_prosesador2 of procesador2 is

COMPONENT adder
	PORT(
		adder2 : IN std_logic_vector(31 downto 0);
		input : IN std_logic_vector(31 downto 0);          
		output : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT ProgramCounter
	PORT(
		CLK : IN std_logic;
		RESET : IN std_logic;
		PC_IN : IN std_logic_vector(31 downto 0);          
		PC_OUT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT instruction_memory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;           
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT unidad_de_control
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0) 
		);
	END COMPONENT;

COMPONENT registerFile
	PORT(
		reset : IN std_logic;
		registerSource1 : IN std_logic_vector(4 downto 0);
		registerSource2 : IN std_logic_vector(4 downto 0);
		registerDestination : IN std_logic_vector(4 downto 0);
		dataToWrite : IN std_logic_vector(31 downto 0);          
		contentRegisterSource1 : OUT std_logic_vector(31 downto 0);
		contentRegisterSource2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT multiplexor
	PORT(
		data : IN std_logic_vector(31 downto 0);
		seuoperando : IN std_logic_vector(31 downto 0);
		selimmediate : IN std_logic;          
		operandoalu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT seu
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		simm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT alu
	PORT(
		operando1 : IN std_logic_vector(31 downto 0);
		operando2 : IN std_logic_vector(31 downto 0);
		aluOP : IN std_logic_vector(5 downto 0);          
		aluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



signal sumadorTonpc, npcTopc, pcToim, s32, aluresultado, rfToalu1, rfTomux, seuTomux, muxToalu: STD_LOGIC_VECTOR (31 downto 0);
signal aluop1: std_logic_vector(5 downto 0);

begin

Inst_adder: adder PORT MAP(
		adder2 => x"00000001",
		input => npcTopc ,
		output => sumadorTonpc
	);
	
Inst_nextProgramCounter: ProgramCounter PORT MAP(
		CLK => clk,
		RESET => reset ,
		PC_IN =>sumadorTonpc ,
		PC_OUT => npcTopc
	);
	
Inst_ProgramCounter: ProgramCounter PORT MAP(
		CLK => clk,
		RESET => reset ,
		PC_IN =>npcTopc ,
		PC_OUT =>pcToim	
	);
	
Inst_instruction_memory: instruction_memory PORT MAP(
		address =>pcToim ,
		reset => reset,
		outInstruction => s32
	);
	
Inst_unidad_de_control: unidad_de_control PORT MAP(
		op =>s32(31 downto 30),
		op3 =>s32(24 downto 19) ,
		ALUOP => aluop1
	);
	
Inst_registerFile: registerFile PORT MAP(
		reset => reset,
		registerSource1 =>s32(18 downto 14) ,
		registerSource2 =>s32(4 downto 0) ,
		registerDestination => s32(29 downto 25),
		dataToWrite => aluresultado,
		contentRegisterSource1 => rfToalu1,
		contentRegisterSource2 => rfTomux
	);

Inst_multiplexor: multiplexor PORT MAP(
		data => rfTomux,
		seuoperando => seuTomux,
		selimmediate => s32(13),
		operandoalu => muxToalu
	);


	Inst_seu: seu PORT MAP(
		simm13 => s32(12 downto 0),
		simm32 => seuTomux
	);	
	 
	Inst_alu: alu PORT MAP(
		operando1 => rfToalu1,
		operando2 =>muxToalu ,
		aluOP =>aluop1 ,
		aluResult => aluresultado
	);
	
resultado <= aluresultado;


end arq_prosesador2;
