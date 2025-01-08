---------------------------------------------------------------------------------
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
        
        SIGNAL Grey_scaled : UNSIGNED(3 DOWNTO 0);
        
begin
  R_in <= unsigned(data_in(11 downto 8));
  G_in <= unsigned(data_in(7 downto 4));
  B_in <= unsigned(data_in(3 downto 0));

    process(data_in)
        VARIABLE temp : unsigned(11 downto 0); -- Temporary 11-bit value for calculations
        variable R_scaled, G_scaled, B_scaled : unsigned(11 downto 0);
    begin 
        R_scaled := unsigned(R_in) * to_unsigned(77, 8);
    G_scaled := unsigned(G_in) * to_unsigned(150, 8);
    B_scaled := unsigned(B_in) * to_unsigned(29, 8);
    
    temp := R_scaled + G_scaled + B_scaled;
            
            Grey_scaled <= temp(11 downto 8);  
    end process;
    
    data_out <= std_logic_vector(Grey_scaled & Grey_scaled & Grey_scaled);
end Behavioral;
