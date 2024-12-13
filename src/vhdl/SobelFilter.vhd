----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2024 11:14:00
-- Design Name: 
-- Module Name: SobelFilter - Behavioral
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

library work;
use work.SobelTypes.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity SobelFilter is
  Port (
    CLK                  : IN STD_LOGIC;
    filter_start         : IN std_logic; -- wait for start value to be 0xab
    
    filter_data_tl       : IN std_logic_vector(11 downto 0); -- input 1 pixel top left
    filter_data_t        : IN std_logic_vector(11 downto 0); -- input 1 pixel top 
    filter_data_tr       : IN std_logic_vector(11 downto 0); -- input 1 pixel top right
    filter_data_l        : IN std_logic_vector(11 downto 0); -- input 1 pixel left
    filter_data_c        : IN std_logic_vector(11 downto 0); -- input 1 pixel centre 
    filter_data_r        : IN std_logic_vector(11 downto 0); -- input 1 pixel right
    filter_data_bl       : IN std_logic_vector(11 downto 0); -- input 1 pixel bottom left
    filter_data_b        : IN std_logic_vector(11 downto 0); -- input 1 pixel bottom
    filter_data_br       : IN std_logic_vector(11 downto 0); -- input 1 pixel bottom right

    filter_busy          : OUT std_logic_vector(7 downto 0); -- 0x55 when filtering in progress, otherwise 0x44
    filter_data_o_x      : OUT std_logic_vector(31 downto 0); -- value of the filtered pixel in the x-direction
    filter_data_o_y      : OUT std_logic_vector(31 downto 0); -- value of the filtered pixel in the y-direction
    filter_data_o        : OUT std_logic_vector(31 downto 0); -- value of filtered pixel
    filter_pixel_ready : OUT std_logic; -- 1 if filtering is complete
    
    framebuffer_address   : OUT std_logic_vector(18 downto 0);
    framebuffer_data     : OUT std_logic_vector(11 downto 0)
   );
end SobelFilter;

architecture Behavioral of SobelFilter is
begin

filter_pixel_ready <= '1';

end Behavioral;
