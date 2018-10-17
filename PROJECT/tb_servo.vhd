--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:38 05/11/2016
-- Design Name:   
-- Module Name:   C:/Users/Kris/Dropbox/FPGA/PROJECT/tb_servo.vhd
-- Project Name:  kcpsm6_atlys
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: uart6_atlys
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
 
ENTITY tb_servo IS
END tb_servo;
 
ARCHITECTURE behavior OF tb_servo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart6_atlys
    PORT(
         uart_rx : IN  std_logic;
         uart_tx : OUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         switch : IN  std_logic_vector(7 downto 0);
         reset_b : IN  std_logic;
         clk : IN  std_logic;
         pico_in : IN  std_logic_vector(7 downto 0);
         servo_out_1 : OUT  std_logic;
         servo_out_2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal uart_rx : std_logic := '0';
   signal switch : std_logic_vector(7 downto 0) := (others => '0');
   signal reset_b : std_logic := '0';
   signal clk : std_logic := '0';
   signal pico_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal uart_tx : std_logic;
   signal led : std_logic_vector(7 downto 0);
   signal servo_out_1 : std_logic;
   signal servo_out_2 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: uart6_atlys PORT MAP (
          uart_rx => uart_rx,
          uart_tx => uart_tx,
          led => led,
          switch => switch,
          reset_b => reset_b,
          clk => clk,
          pico_in => pico_in,
          servo_out_1 => servo_out_1,
          servo_out_2 => servo_out_2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	   
		--4
		pico_in <= "00000100";
		-- insert stimulus here

		WAIT FOR 20 ms;
	 		
		--125
		pico_in <= "01111101";
		-- insert stimulus here

		WAIT FOR 20 ms;
	 
		--255
		pico_in <= "11111111";
	 
		WAIT FOR 20 ms;

   end process;

END;
