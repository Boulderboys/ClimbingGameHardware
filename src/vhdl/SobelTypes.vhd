----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 11:40:31
-- Design Name: 
-- Module Name: SobelTypes - Behavioral
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

package SobelTypes is
  type row_array is array (0 to 2) of std_logic_vector(7 downto 0);
  type array2D is array (0 to 2) of row_array;
  
  type sobel_coeff_array is array (0 to 8) of std_logic_vector(8 downto 0);
  
   CONSTANT sobel_coeff_x : sobel_coeff_array := (
    X"01", X"02", X"01",
    X"00", X"00", X"00",
    X"FF", X"FE", X"FF"
    );

CONSTANT sobel_coeff_y : sobel_coeff_array := (
    X"FF", X"00", X"01",
    X"FE", X"00", X"02",
    X"FF", X"00", X"01"
    );
end SobelTypes;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
