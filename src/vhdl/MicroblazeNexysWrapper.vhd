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
    CPU_RESETN : in std_logic;
    CLK100MHZ : in std_logic;
    UART_RXD_OUT : in std_logic;
    UART_TXD_IN : out std_logic
  );
end MicroblazeNexysWrapper;

architecture Structural of MicroblazeNexysWrapper is
  component bd_microblaze_wrapper is
    port (
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
        SW,
        LED,
        CPU_RESETN,
        CLK100MHZ,
        UART_RXD_OUT,
        UART_TXD_IN
    );
end Structural;
