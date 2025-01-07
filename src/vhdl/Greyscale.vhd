----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2025 15:29:27
-- Design Name: 
-- Module Name: Greyscale - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Greyscale is
port (
    data_in : in std_logic_vector(11 downto 0);
    data_out : out std_logic_vector (11 downto 0));
end Greyscale;

architecture Behavioral of Greyscale is
        signal R_in : unsigned(3 downto 0);
        signal G_in : unsigned(3 downto 0);
        signal B_in : unsigned(3 downto 0);
        
        SIGNAL Gray_scaled : UNSIGNED(3 DOWNTO 0);
        
begin
  R_in <= unsigned(data_in(11 downto 8));
  G_in <= unsigned(data_in(7 downto 4));
  B_in <= unsigned(data_in(3 downto 0));

    process(data_in)
        VARIABLE temp : UNSIGNED(7 DOWNTO 0); -- Temporary 8-bit value for calculations
    begin 
            temp := (R_in * 77) + (G_in * 150) + (B_in * 29);
            
            Gray_scaled <= temp(7 DOWNTO 4);  
    end process;
    
    data_out <= std_logic_vector(Gray_scaled) & std_logic_vector(Gray_scaled) & std_logic_vector(Gray_scaled);
end Behavioral;
