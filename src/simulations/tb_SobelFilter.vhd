library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench voor SobelFilter
entity tb_SobelFilter is
end entity;

architecture Behavioral of tb_SobelFilter is

  -- Component declaration
  component SobelFilter
    Port (
      CLK : in STD_LOGIC;
      RESET : in STD_LOGIC;
      PIXEL_IN : in integer range 0 to 255;
      VALID_IN : in STD_LOGIC;
      PIXEL_OUT : out integer range 0 to 255;
      VALID_OUT : out STD_LOGIC
    );
  end component;

  -- Testbench signalen
  signal CLK : STD_LOGIC := '0';
  signal RESET : STD_LOGIC := '1';
  signal PIXEL_IN : integer range 0 to 255 := 0;
  signal VALID_IN : STD_LOGIC := '0';
  signal PIXEL_OUT : integer range 0 to 255;
  signal VALID_OUT : STD_LOGIC;

  -- Clock periode
  constant CLK_PERIOD : time := 20 ns;  -- 50 MHz klok

begin

  -- Instantieer de SobelFilter
  uut: SobelFilter
    port map (
      CLK => CLK,
      RESET => RESET,
      PIXEL_IN => PIXEL_IN,
      VALID_IN => VALID_IN,
      PIXEL_OUT => PIXEL_OUT,
      VALID_OUT => VALID_OUT
    );

  -- Clock genereren
  clock_process: process
  begin
    while True loop
      CLK <= not CLK;
      wait for CLK_PERIOD / 2;
    end loop;
  end process;

  -- Reset genereren
  reset_process: process
  begin
    RESET <= '1';
    wait for 50 ns;  -- Reset blijft actief voor 50 ns
    RESET <= '0';
    wait;
  end process;

  -- Pixel-invoer genereren
  pixel_input_process: process
  begin
    wait until RESET = '0';  -- Wacht tot reset inactief is

    for row in 0 to 479 loop
      for col in 0 to 639 loop
        PIXEL_IN <= (row + col) mod 256;  -- Simuleer een gradient patroon
        VALID_IN <= '1';
        wait for CLK_PERIOD;  -- Geef elke pixel één klokcyclus
      end loop;
    end loop;

    VALID_IN <= '0';  -- Invoer stopt na de volledige afbeelding
    wait;
  end process;

  -- Controleer uitvoer
  output_monitor_process: process
  begin
    wait until RESET = '0';  -- Wacht tot reset inactief is

    while True loop
      wait until rising_edge(CLK);
      if VALID_OUT = '1' then
        report "Output Pixel: " & integer'image(PIXEL_OUT);
      end if;
    end loop;
  end process;

end Behavioral;
