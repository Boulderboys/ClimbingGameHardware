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
    component clk_wiz_0 is
        Port (
            clk_in1 : in std_logic;
            reset   : in std_logic;
            locked  : out std_logic;
            clk_out1 : out std_logic;
            clk_out2 : out std_logic
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
    
    signal clk_108mhz : std_logic;
    signal clk_90mhz : std_logic;
    signal locked : std_logic;
begin
    clk_wiz : clk_wiz_0 port map(CLK100MHZ, '0', locked, clk_108mhz, clk_90mhz);
    Microblaze : MicroblazeNexysWrapper port map(SW, LED, CPU_RESETN, clk_90mhz, UART_RXD_OUT, UART_TXD_IN);
    vgascreen: vgaTest port map (vga_r => VGA_R, vga_g => VGA_G, vga_b => VGA_B, vga_hs => VGA_HS, 
    vga_vs => VGA_VS, clk => clk_108mhz, reset => '0');
end Structural;
