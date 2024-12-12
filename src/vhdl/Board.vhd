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
        BTN : in std_logic_vector(3 downto 0);
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

component bd_microblaze_wrapper is
  port (
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_HS_o : out STD_LOGIC;
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    btn_0 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dip_switches_16bits_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    ov7670_data_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    ov7670_href_0 : in STD_LOGIC;
    ov7670_pclk_0 : in STD_LOGIC;
    ov7670_pwdn_0 : out STD_LOGIC;
    ov7670_reset_0 : out STD_LOGIC;
    ov7670_vsync_0 : in STD_LOGIC;
    ov7670_xclk_0 : out STD_LOGIC;
    reset : in STD_LOGIC;
    scl_0 : inout STD_LOGIC;
    sda_0 : inout STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    vga_used_by_camera_0 : in STD_LOGIC
  );
  end component bd_microblaze_wrapper;
    
begin
    Microblaze : bd_Microblaze_Wrapper port map(
        VGA_B_o => VGA_B, VGA_G_o => VGA_G, VGA_R_o => VGA_R,
        VGA_HS_o => VGA_HS, VGA_VS_o => VGA_VS,
        btn_0 => BTN(3 downto 0), dip_switches_16bits_tri_i => SW(15 downto 0), led_16bits_tri_o => LED(15 downto 0),
        ov7670_data_0 => ov7670_data, ov7670_href_0 => JB(3), ov7670_pclk_0 => JB(10), ov7670_pwdn_0 => JA(1),
        ov7670_reset_0 => JA(7), ov7670_vsync_0 => JB(8), ov7670_xclk_0 => JB(2), scl_0 => JB(9), sda_0 => JB(4),
        reset => CPU_RESETN, 
        sys_clock => CLK100MHZ, usb_uart_rxd => UART_RXD_OUT, 
        usb_uart_txd => UART_TXD_IN,
        vga_used_by_camera_0 => SW(0)
    );
end Structural;
