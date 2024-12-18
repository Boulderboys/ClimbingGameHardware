----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2024 12:15:57
-- Design Name: 
-- Module Name: BRAMSelector - Behavioral
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

entity BRAMSelector is
    Port ( 
        addra_cam : in STD_LOGIC_VECTOR (18 downto 0);
        clk: in STD_LOGIC;
        dina_cam: in STD_LOGIC_VECTOR(7 downto 0);
        wea_cam: in STD_LOGIC_VECTOR(0 downto 0);
        
        addra_processor : in STD_LOGIC_VECTOR (18 downto 0);
        dina_processor : in STD_LOGIC_VECTOR(7 downto 0);
        wea_processor : in STD_LOGIC_VECTOR(0 downto 0);

        clk_out : out STD_LOGIC;
        addra_out : out STD_LOGIC_VECTOR(18 downto 0);
        dina_out : out STD_LOGIC_VECTOR(7 downto 0);
        wea_out : out STD_LOGIC_VECTOR(0 downto 0);
        
        doutb_in : in STD_LOGIC_VECTOR(7 downto 0);
        
        doutb_out : out STD_LOGIC_VECTOR(7 downto 0);
        used_by_processor : in STD_LOGIC
    );
end BRAMSelector;

architecture Behavioral of BRAMSelector is

begin

    clk_out <= clk;
    
    addra_out <= addra_processor when used_by_processor = '1' else addra_cam;
    dina_out <= dina_processor when used_by_processor = '1' else dina_cam;
    wea_out <= wea_processor when used_by_processor = '1' else wea_cam;
    doutb_out <= doutb_in;
end Behavioral;
