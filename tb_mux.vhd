--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:38:33 04/10/2017
-- Design Name:   
-- Module Name:   C:/Users/Kimtaro/Desktop/Monolitico/tb_mux.vhd
-- Project Name:  Monolitico
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexor
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mux IS
END tb_mux;
 
ARCHITECTURE behavior OF tb_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexor
    PORT(
         data : IN  std_logic_vector(31 downto 0);
         seuoperando : IN  std_logic_vector(31 downto 0);
         selimmediate : IN  std_logic;
         operandoalu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal data : std_logic_vector(31 downto 0) := (others => '0');
   signal seuoperando : std_logic_vector(31 downto 0) := (others => '0');
   signal selimmediate : std_logic := '0';

 	--Outputs
   signal operandoalu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexor PORT MAP (
          data => data,
          seuoperando => seuoperando,
          selimmediate => selimmediate,
          operandoalu => operandoalu
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
    

      wait for 100 ns;
		data <= x"00000011";
      seuoperando <=  x"11111100";
      selimmediate <= '1';
		
		wait for 100 ns;
		data <= x"00000011";
      seuoperando <=  x"11111100";
      selimmediate <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
