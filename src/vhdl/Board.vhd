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

component OV7670Top is
    Port (
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
        
        ram_addra : out STD_LOGIC_VECTOR(18 downto 0);
        ram_dina : out STD_LOGIC_VECTOR(11 downto 0);
        ram_wea : out STD_LOGIC_VECTOR(0 downto 0)
    );
end component;

component bd_microblaze_wrapper is
port (
    VGA_B_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_G_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_HS_o : out STD_LOGIC;
    VGA_R_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    VGA_VS_o : out STD_LOGIC;
    addra_cam_0 : in STD_LOGIC_VECTOR ( 18 downto 0 );
    clk_out3_0 : out STD_LOGIC;
    dina_cam_0 : in STD_LOGIC_VECTOR ( 11 downto 0 );
    dip_switches_16bits_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    led_16bits_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    usb_uart_rxd : in STD_LOGIC;
    usb_uart_txd : out STD_LOGIC;
    used_by_processor_0 : in STD_LOGIC;
    wea_cam_0 : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component bd_microblaze_wrapper;
  
  signal camera_ram_addra : std_logic_vector(18 downto 0);
  signal camera_ram_dina : std_logic_vector(11 downto 0);
  signal camera_ram_wea : std_logic_vector(0 downto 0);
  signal camera_clk : std_logic;
  
begin
    Microblaze : bd_Microblaze_Wrapper port map(
        VGA_B_o => VGA_B, VGA_G_o => VGA_G, VGA_R_o => VGA_R,
        VGA_HS_o => VGA_HS, VGA_VS_o => VGA_VS,
        dip_switches_16bits_tri_i => SW(15 downto 0), led_16bits_tri_o => LED(15 downto 0),
        reset => CPU_RESETN, 
        sys_clock => CLK100MHZ, usb_uart_rxd => UART_RXD_OUT, 
        usb_uart_txd => UART_TXD_IN,
        
        clk_out3_0 => camera_clk,
        addra_cam_0 => camera_ram_addra, wea_cam_0 => camera_ram_wea,
        dina_cam_0 => camera_ram_dina,
        used_by_processor_0 => SW(0)
    );
    
    Camera : OV7670Top port map(
        clk => camera_clk,
        scl => JB(9),
        sda => JB(4),
        ov7670_vsync => JB(8),
        ov7670_href => JB(3),
        ov7670_pclk => JB(10),
        ov7670_xclk => JB(2),
        ov7670_data => ov7670_data,
        btn => BTN(3 downto 0),
        ov7670_pwdn => JA(1),
        ov7670_reset => JA(7),
        
        ram_addra => camera_ram_addra,
        ram_dina => camera_ram_dina,
        ram_wea => camera_ram_wea
    );
    
end Structural;
