----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 14:05:22
-- Design Name: 
-- Module Name: PixelBuffer - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PixelBuffer is
  Port ( 
    CLK             : IN STD_LOGIC;
    ready           : IN STD_LOGIC; --ready for next buffer
    input_pixel     : IN STD_LOGIC_VECTOR(11 downto 0);
    
    input_address   : OUT STD_LOGIC_VECTOR(15 downto 0);
    pixel_tl        : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_t         : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_tr        : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_l         : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_c         : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_r         : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_bl        : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_b         : OUT STD_LOGIC_VECTOR(11 downto 0);
    pixel_br        : OUT STD_LOGIC_VECTOR(11 downto 0)
  );
end PixelBuffer;

architecture Behavioral of PixelBuffer is

begin

  -- Address logic
  process(CLK)
  begin

  end process;

  -- Assign outputs
  input_address <= "0000000000000000";
  pixel_tl <= ("000000000000");
  pixel_t  <= ("000000000000");
  pixel_tr <= ("000000000000");
  pixel_l  <= ("000000000000");
  pixel_c  <= ("000000000000");
  pixel_r  <= ("000000000000");
  pixel_bl <= ("000000000000");
  pixel_b  <= ("000000000000");
  pixel_br <= ("000000000000");

end Behavioral;
