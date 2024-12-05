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
        SW : in std_logic_vector(15 downto 0);
        LED : out std_logic_vector(15 downto 0);
        
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

--    component VgaScreen is
--        Port (
--            vga_r : out std_logic_vector(3 downto 0);
--            vga_g : out std_logic_vector(3 downto 0);
--            vga_b : out std_logic_vector(3 downto 0);
--            vga_hs : out std_logic;
--            vga_vs : out std_logic;
--            clk : in std_logic;
--            reset : in std_logic;
--        bram_addr   : out std_logic_vector(18 downto 0);
--        bram_data   : in  std_logic_vector(8 downto 0) 
--        );
--    end component VgaScreen;
    component bd_Microblaze_Wrapper is
        Port (
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_HS_o : out STD_LOGIC;
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    dip_switches_16bits_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC
        );
    end component bd_Microblaze_Wrapper;
begin
   Microblaze : bd_Microblaze_Wrapper port map(VGA_B_o => VGA_B, VGA_G_o => VGA_G, VGA_R_o => VGA_R,
   VGA_HS_o => VGA_HS, VGA_VS_o => VGA_VS,dip_switches_16bits_tri_i => SW(15 downto 0) 
   ,led_16bits_tri_o => LED(15 downto 0), reset => CPU_RESETN, sys_clock => clk100mhz, usb_uart_rxd => UART_RXD_OUT
   , usb_uart_txd => UART_TXD_IN);
--    vga: VgaScreen port map (vga_r => VGA_R, vga_g => VGA_G, vga_b => VGA_B, vga_hs => VGA_HS, 
--    vga_vs => VGA_VS, clk => clk_25mhz, reset => '0', bram_data => "000000001");
end Structural;
