--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:36:49 05/09/2016
-- Design Name:   
-- Module Name:   C:/Users/Kris/Dropbox/FPGA/PROJECT/sqcsc.vhd
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
 
ENTITY sqcsc IS
END sqcsc;
 
ARCHITECTURE behavior OF sqcsc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT uart6_atlys
    PORT(
         uart_rx : IN  std_logic;
         uart_tx : OUT  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         switch : IN  std_logic_vector(7 downto 0);
         reset_b : IN  std_logic;
         clk : IN  std_logic;
         pico_in_lol : IN  std_logic_vector(7 downto 0);
         port_out_lol : OUT  std_logic_vector(7 downto 0);
         servo_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal uart_rx : std_logic := '0';
   signal switch : std_logic_vector(7 downto 0) := (others => '0');
   signal reset_b : std_logic := '0';
   signal clk : std_logic := '0';
   signal pico_in_lol : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal uart_tx : std_logic;
   signal led : std_logic_vector(7 downto 0);
   signal port_out_lol : std_logic_vector(7 downto 0);
   signal servo_out : std_logic;

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
          pico_in_lol => pico_in_lol,
          port_out_lol => port_out_lol,
          servo_out => servo_out
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
