----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 13:11:37
-- Design Name: 
-- Module Name: Board - Structural
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


entity Board is
    Port (
        BTNC : in std_logic;
        BTNU : in std_logic;
        BTNL : in std_logic;
        BTNR : in std_logic;
        SW : in std_logic_vector(15 downto 0);
        LED : out std_logic_vector(15 downto 0);
        JA : inout std_logic_vector(11 downto 0);
        JB : inout std_logic_vector(11 downto 0);
        ov7670_data : inout std_logic_vector(7 downto 0); -- defined in constraints file
        
        VGA_R : out std_logic_vector(3 downto 0);
        VGA_G : out std_logic_vector(3 downto 0);
        VGA_B : out std_logic_vector(3 downto 0);
        VGA_HS : out std_logic;
        VGA_VS : out std_logic;
        CPU_RESETN : in std_logic;
        CLK100MHZ : in std_logic;
        UART_RXD_OUT : in std_logic;
        UART_TXD_IN : out std_logic
    );
end Board;

architecture Structural of Board is
    component clk_wiz_0 is
        Port (
            clk_in1 : in std_logic;
            reset   : in std_logic;
            locked  : out std_logic;
            clk_out1 : out std_logic;
            clk_out2 : out std_logic;
            clk_out3 : out std_logic
        );
    end component;
    component VgaTest is
        Port (
            vga_r : out std_logic_vector(3 downto 0);
            vga_g : out std_logic_vector(3 downto 0);
            vga_b : out std_logic_vector(3 downto 0);
            vga_hs : out std_logic;
            vga_vs : out std_logic;
            clk : in std_logic;
            reset : in std_logic
        );
    end component VgaTest;
    component VGASelector is
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
    end component VGASelector;
    component MicroblazeNexysWrapper is
        Port (
            SW : in std_logic_vector(15 downto 0);
            LED : out std_logic_vector(15 downto 0);
            CPU_RESETN : in std_logic;
            CLK100MHZ : in std_logic;
            UART_RXD_OUT : in std_logic;
            UART_TXD_IN : out std_logic
        );
    end component MicroblazeNexysWrapper;
    COMPONENT OV7670Top IS
    PORT (
        clk : IN STD_LOGIC;
        scl : INOUT STD_LOGIC;
        sda : INOUT STD_LOGIC;
        ov7670_vsync : IN STD_LOGIC;
        ov7670_href : IN STD_LOGIC;
        ov7670_pclk : IN STD_LOGIC;
        ov7670_xclk : OUT STD_LOGIC;
        ov7670_data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        btn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        ov7670_pwdn : OUT STD_LOGIC;
        ov7670_reset : OUT STD_LOGIC;
        VGA_HS_O : OUT STD_LOGIC;
        VGA_VS_O : OUT STD_LOGIC;
        VGA_R : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_B : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_G : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        frame_buffer_out_processing : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END COMPONENT OV7670Top;
    
    signal clk_108mhz_vga : std_logic;
    signal clk_90mhz_microblaze : std_logic;
    signal clk_101mhz_camera : std_logic;
    
    signal vga_r_camera : std_logic_vector(3 downto 0);
    signal vga_g_camera : std_logic_vector(3 downto 0);
    signal vga_b_camera : std_logic_vector(3 downto 0);
    signal vga_hs_camera : std_logic;
    signal vga_vs_camera : std_logic;
    
    signal vga_r_processing : std_logic_vector(3 downto 0);
    signal vga_g_processing : std_logic_vector(3 downto 0);
    signal vga_b_processing : std_logic_vector(3 downto 0);
    signal vga_hs_processing : std_logic;
    signal vga_vs_processing : std_logic;
    
    signal frame_buffer_doutb : std_logic_vector(11 downto 0);

    
    signal locked : std_logic;
begin
    camera : OV7670Top port map(clk => clk_101mhz_camera, scl => JB(9), sda => JB(4), 
                                     ov7670_vsync => JB(8), ov7670_href => JB(3), ov7670_pclk => JB(10), 
                                     ov7670_xclk => JB(2),
                                     ov7670_data => ov7670_data, btn(0) => BTNC, btn(1) => BTNU,
                                     btn(2) => BTNL, btn(3) => BTNR, ov7670_pwdn => JA(1), ov7670_reset => JA(7),
                                     VGA_HS_O => vga_hs_camera, VGA_VS_O => vga_vs_camera, VGA_R => vga_r_camera, 
                                     VGA_B => vga_b_camera, VGA_G => vga_g_camera, frame_buffer_out_processing => frame_buffer_doutb
                                     );
    clk_wiz : clk_wiz_0 port map(CLK100MHZ, '0', locked, clk_108mhz_vga, clk_90mhz_microblaze, clk_101mhz_camera);
    Microblaze : MicroblazeNexysWrapper port map(SW, LED, CPU_RESETN, clk_90mhz_microblaze, UART_RXD_OUT, UART_TXD_IN);
    SelectVGASignal : VGASelector port map (vga_used_by_camera => SW(0), 
                                        vga_r_camera => vga_r_camera,
                                        vga_g_camera => vga_g_camera,
                                        vga_b_camera => vga_b_camera,
                                        vga_hs_camera => vga_hs_camera,
                                        vga_vs_camera => vga_vs_camera,
                                        vga_r_processing => vga_r_processing,
                                        vga_g_processing => vga_g_processing,
                                        vga_b_processing => vga_b_processing,
                                        vga_hs_processing => vga_hs_processing,
                                        vga_vs_processing => vga_vs_processing,
                                        VGA_R => VGA_R, VGA_G => VGA_G,
                                        VGA_B => VGA_B, VGA_HS => VGA_HS,
                                        VGA_VS => VGA_VS);
    vgascreen: vgaTest port map (vga_r => vga_r_processing, vga_g => vga_g_processing, vga_b => vga_b_processing, vga_hs => vga_hs_processing, 
                                 vga_vs => vga_vs_processing, clk => clk_108mhz_vga, reset => '0');
end Structural;
