----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 15:32:53
-- Design Name: 
-- Module Name: MicroblazeNexysWrapper - Structural
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

entity MicroblazeNexysWrapper is
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
end MicroblazeNexysWrapper;

architecture Structural of MicroblazeNexysWrapper is
  component bd_microblaze_wrapper is
    port (
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
    end component bd_microblaze_wrapper;
begin
    Microblaze : component bd_microblaze_wrapper port map(
        dip_switches_16bits_tri_i => SW,
        led_16bits_tri_o => LED,
        VGA_R_o => VGA_R,
        VGA_G_o => VGA_G,
        VGA_B_o => VGA_B,
        VGA_HS_o => VGA_HS,
        VGA_VS_o => VGA_VS,
        reset => CPU_RESETN,
        sys_clock => CLK100MHZ,
        usb_uart_rxd => UART_RXD_OUT,
        usb_uart_txd => UART_TXD_IN
    );
end Structural;
