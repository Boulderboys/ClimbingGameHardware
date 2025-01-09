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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


entity SobelFilter is
  Port (
        CLK : in STD_LOGIC;
        RESET : in STD_LOGIC;
        PIXEL_IN: in STD_LOGIC_VECTOR(11 downto 0);
        VALID_IN: in STD_LOGIC;
        PIXEL_OUT: out STD_LOGIC;
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
    
    type line_buffer_t is array(0 to 2, 0 to 479) of integer range 0 to 3840;
    signal line_buffer : line_buffer_t := (others => (others => 0));
    signal window : Sobel_2d_array := (others => (others => 0));
    
    signal row : std_logic_vector(9 downto 0):= (others => '0');
    signal col : std_logic_vector(8 downto 0):= (others => '0');
    
    signal sumx, sumy, result : integer range -10000 to 10000 := 0;
    signal valid_pixel : STD_LOGIC := '0';

begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                line_buffer <= (others => (others => 0));
                window <= (others => (others => 0));
                row <= (OTHERS => '0');
                col <= (OTHERS => '0');
                valid_pixel <= '0';
             elsif VALID_IN = '1'  then
                line_buffer(2,TO_INTEGER(unsigned(col))) <= line_buffer(1,to_integer(unsigned(col)));
                line_buffer(1,TO_INTEGER(unsigned(col))) <= line_buffer(0,TO_INTEGER(unsigned(col)));
                line_buffer(0, TO_INTEGER(unsigned(col))) <= to_integer(unsigned(PIXEL_IN));
                
                if unsigned(col) >= 2 and unsigned(row) >= 2 and unsigned(col) <= 479 and unsigned(row) <= 639then
                  window(0,0) <= line_buffer(2, to_integer(unsigned(col)-2));
                  window(0,1) <= line_buffer(2,to_integer(unsigned(col)-1));
                  window(0,2) <= line_buffer(2,to_integer(unsigned(col)));
                  window(1,0) <= line_buffer(1,to_integer(unsigned(col)-2));
                  window(1,1) <= line_buffer(1,to_integer(unsigned(col)-1));
                  window(1,2) <= line_buffer(1,to_integer(unsigned(col)));
                  window(2,0) <= line_buffer(0,to_integer(unsigned(col)-2));
                  window(2,1) <= line_buffer(0,to_integer(unsigned(col)-1));
                  window(2,2) <= line_buffer(0,to_integer(unsigned(col)));
                  
                  sumx <= 0;
                  sumy <= 0;
                  for i in 0 to 2 loop
                    for j in 0 to 2 loop
                      sumx <= sumx + window(i,j) * Gx(i, j);
                      sumy <= sumy + window(i,j) * Gy(i, j);
                    end loop;
                  end loop;
                  
                  
              result <= abs(sumx) + abs(sumy);
              if result > 4094 then  -- 3839
                PIXEL_OUT <= '1';
              else
                PIXEL_OUT <= '0';
              end if;
    
              valid_pixel <= '1';
            else
              valid_pixel <= '0';
            end if;
    
            if TO_INTEGER(unsigned(col)) < 479 then
              col <= std_logic_vector(unsigned(col) + 1);
            else
              col <= (OTHERS => '0');
              if unsigned(row) < 639 then
                row <= std_logic_vector(unsigned(row) + 1);
              else
                row <= (OTHERS => '0');
              end if;
            end if;
          end if;
        end if;
      end process;
    
  VALID_OUT <= valid_pixel;
              

end Behavioral;
