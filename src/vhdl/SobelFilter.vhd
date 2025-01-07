----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2025 14:26:29
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


package my_types_pkg is
  subtype pixel_t is integer range 0 to 255;
end package;

library work;
use work.my_types_pkg.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SobelFilter is
  Port (
        CLK : in STD_LOGIC;
        RESET : in STD_LOGIC;
        PIXEL_IN: in pixel_t;
        VALID_IN: in STD_LOGIC;
        PIXEL_OUT: out pixel_t;
        VALID_OUT: out STD_LOGIC
         );
end SobelFilter;

architecture Behavioral of SobelFilter is
    type Sobel_2d_array is array(0 to 2, 0 to 2) of integer;
    constant Gx : Sobel_2d_array := ((-1, 0, 1), 
                                     (-2, 0, 2), 
                                     (-1, 0, 1));
    constant Gy : Sobel_2d_array := ((1, 2, 1), 
                                     (0, 0, 0), 
                                     (-1, -2, -1));
    
    type line_buffer_t is array(0 to 2, 0 to 479) of pixel_t;
    signal line_buffer : line_buffer_t := (others => (others => 0));
    signal window : Sobel_2d_array := (others => (others => 0));
    
    signal row : integer range 0 to 639 := 0;
    signal col : integer range 0 to 479 := 0;
    
    signal sumx, sumy, result : integer := 0;
    signal valid_pixel : STD_LOGIC := '0';

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                line_buffer <= (others => (others => 0));
                window <= (others => (others => 0));
                row <= 0;
                col <= 0;
                valid_pixel <= '0';
             elsif VALID_IN = '1' then
                line_buffer(2,col) <= line_buffer(1,col);
                line_buffer(1,col) <= line_buffer(0,col);
                line_buffer(0, col) <= PIXEL_IN;
                
                if col >= 2 and row >= 2 then
                  window(0,0) <= line_buffer(2,col - 2);
                  window(0,1) <= line_buffer(2,col - 1);
                  window(0,2) <= line_buffer(2,col);
                  window(1,0) <= line_buffer(1,col - 2);
                  window(1,1) <= line_buffer(1,col - 1);
                  window(1,2) <= line_buffer(1,col);
                  window(2,0) <= line_buffer(0,col - 2);
                  window(2,1) <= line_buffer(0,col - 1);
                  window(2,2) <= line_buffer(0,col);
                  
                  sumx <= 0;
                  sumy <= 0;
                  for i in 0 to 2 loop
                    for j in 0 to 2 loop
                      sumx <= sumx + window(i,j) * Gx(i, j);
                      sumy <= sumy + window(i,j) * Gy(i, j);
                    end loop;
                  end loop;
                  
                  
              result <= abs(sumx) + abs(sumy);
              if result > 255 then
                PIXEL_OUT <= 255;
              else
                PIXEL_OUT <= result;
              end if;
    
              valid_pixel <= '1';
            else
              valid_pixel <= '0';
            end if;
    
            if col < 479 then
              col <= col + 1;
            else
              col <= 0;
              if row < 639 then
                row <= row + 1;
              else
                row <= 0;
              end if;
            end if;
          end if;
        end if;
      end process;
    
  VALID_OUT <= valid_pixel;
              

end Behavioral;
