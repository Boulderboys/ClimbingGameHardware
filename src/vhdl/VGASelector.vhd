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
        clk : in std_logic;
        used_by_processor : in std_logic; -- determines which of the two drivers gets control of the VGA display
        bram_data_in : in std_logic_vector(11 downto 0);
        bram_addr_out : out std_logic_vector(18 downto 0);
        VGA_R : out std_logic_vector(3 downto 0);
        VGA_G : out std_logic_vector(3 downto 0);
        VGA_B : out std_logic_vector(3 downto 0);
        VGA_HS : out std_logic;
        VGA_VS : out std_logic
        );
end VGASelector;

architecture Behavioral of VGASelector is

    component VgaScreenProcessor is
    Port (
        vga_r : out std_logic_vector(3 downto 0);
        vga_g : out std_logic_vector(3 downto 0);
        vga_b : out std_logic_vector(3 downto 0);
        vga_hs : out std_logic;
        vga_vs : out std_logic;
        clk : in std_logic;
        bram_addr   : out std_logic_vector(18 downto 0) := (others => '0');
        bram_data   : in  std_logic_vector(11 downto 0)
    );
    end component VgaScreenProcessor;
    
    component VgaScreenCamera IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        pxl_clk : IN STD_LOGIC;
        VGA_HS_O : OUT STD_LOGIC;
        VGA_VS_O : OUT STD_LOGIC;
        VGA_R : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_B : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_G : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);

        start : IN STD_LOGIC;

        --frame_buffer signals
        addrb : OUT STD_LOGIC_VECTOR(18 DOWNTO 0);
        doutb : IN STD_LOGIC_VECTOR(11 DOWNTO 0) --pixel data
    );
    end component VgaScreenCamera;

    signal vga_r_camera : std_logic_vector(3 downto 0);
    signal vga_g_camera : std_logic_vector(3 downto 0);
    signal vga_b_camera : std_logic_vector(3 downto 0);
    signal vga_hs_camera : std_logic;
    signal vga_vs_camera : std_logic;
    signal vga_r_processor : std_logic_vector(3 downto 0);
    signal vga_g_processor : std_logic_vector(3 downto 0);
    signal vga_b_processor : std_logic_vector(3 downto 0);
    signal vga_vs_processor : std_logic;
    signal vga_hs_processor : std_logic;
    
    signal bram_addr_processor : std_logic_vector(18 downto 0);
    signal bram_addr_camera : std_logic_vector(18 downto 0);

begin
    VGACamera : VgaScreenCamera port map (clk => clk, rst => '0', pxl_clk => clk, VGA_HS_O => vga_hs_camera,
                                          VGA_VS_O => vga_vs_camera, VGA_R => vga_r_camera, VGA_B => vga_b_camera,
                                          VGA_G => vga_g_camera, start => '1', addrb => bram_addr_camera, doutb => bram_data_in
                                         );
    VGAProcessor : VgaScreenProcessor port map (vga_r => vga_r_processor, vga_g => vga_g_processor, 
                                                vga_b => vga_b_processor, vga_hs => vga_hs_processor,
                                                vga_vs => vga_vs_processor, clk => clk,
                                                bram_addr => bram_addr_processor, bram_data => bram_data_in
                                               );
    bram_addr_out <= bram_addr_processor when used_by_processor = '1' else bram_addr_camera;
    VGA_HS <= vga_hs_processor when used_by_processor = '1' else vga_hs_camera;
    VGA_VS <= vga_vs_processor when used_by_processor = '1' else vga_vs_camera;
    VGA_R <= vga_r_processor when used_by_processor = '1' else vga_r_camera;
    VGA_G <= vga_g_processor when used_by_processor = '1' else vga_g_camera;
    VGA_B <= vga_b_processor when used_by_processor = '1' else vga_b_camera;
    
end Behavioral;
