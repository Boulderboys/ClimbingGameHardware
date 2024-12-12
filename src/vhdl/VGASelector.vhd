----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.12.2024 11:21:18
-- Design Name: 
-- Module Name: VGASelector - Behavioral
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

entity VGASelector is
    Port (
        vga_used_by_camera : in std_logic; -- determines which of the two drivers gets control of the VGA display
        vga_r_camera : in std_logic_vector(3 downto 0);
        vga_g_camera : in std_logic_vector(3 downto 0);
        vga_b_camera : in std_logic_vector(3 downto 0);
        vga_hs_camera : in std_logic;
        vga_vs_camera : in std_logic;
        vga_r_processing : in std_logic_vector(3 downto 0);
        vga_g_processing : in std_logic_vector(3 downto 0);
        vga_b_processing : in std_logic_vector(3 downto 0);
        vga_hs_processing : in std_logic;
        vga_vs_processing : in std_logic;
        VGA_R : out std_logic_vector(3 downto 0);
        VGA_G : out std_logic_vector(3 downto 0);
        VGA_B : out std_logic_vector(3 downto 0);
        VGA_HS : out std_logic;
        VGA_VS : out std_logic);
end VGASelector;

architecture Behavioral of VGASelector is

begin
    VGA_R <= vga_r_camera when vga_used_by_camera = '1' else vga_r_processing;
    VGA_G <= vga_g_camera when vga_used_by_camera = '1' else vga_g_processing;
    VGA_B <= vga_b_camera when vga_used_by_camera = '1' else vga_b_processing;
    VGA_HS <= vga_hs_camera when vga_used_by_camera = '1' else vga_hs_processing;
    VGA_VS <= vga_vs_camera when vga_used_by_camera = '1' else vga_vs_processing;
end Behavioral;
