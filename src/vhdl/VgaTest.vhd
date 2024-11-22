library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vgaTest is
    Port (
        vga_r : out std_logic_vector(3 downto 0);
        vga_g : out std_logic_vector(3 downto 0);
        vga_b : out std_logic_vector(3 downto 0);
        vga_hs : out std_logic;
        vga_vs : out std_logic;
        clk : in std_logic;
        reset : in std_logic
    );
end vgaTest;

architecture Behavioral of vgaTest is

    signal h_cnt : unsigned(10 downto 0) := (others => '0');
    signal v_cnt : unsigned(10 downto 0) := (others => '0');
    signal pix_clock : std_logic := '0';
    
    constant H_ACTIVE    : integer := 1280;
    constant H_FP        : integer := 48;
    constant H_SYNC      : integer := 112;
    constant H_BP        : integer := 248;
    constant H_TOTAL     : integer := 1688;

    constant V_ACTIVE    : integer := 1024;
    constant V_FP        : integer := 1;
    constant V_SYNC      : integer := 3;
    constant V_BP        : integer := 38;
    constant V_TOTAL     : integer := 1066;
    
        -- Signalen voor klokbeheer
    signal locked : std_logic;
    
        -- Instantieer de Clocking Wizard
    component clk_wiz_0 is
        Port (
            clk_in1 : in std_logic;
            reset   : in std_logic;
            locked  : out std_logic;
            clk_out1 : out std_logic
        );
    end component;

begin
    -- Horizontale en verticale teller
    process(clk, reset)
    begin
        if reset = '1' then
            h_cnt <= (others => '0');
            v_cnt <= (others => '0');
        elsif rising_edge(clk) then
            if h_cnt = H_TOTAL - 1 then
                h_cnt <= (others => '0');
                if v_cnt = V_TOTAL - 1 then
                    v_cnt <= (others => '0');
                else
                    v_cnt <= v_cnt + 1;
                end if;
            else
                h_cnt <= h_cnt + 1;
            end if;
        end if;
    end process;

    -- Synchronisatiesignalen
    vga_hs <= '0' when (h_cnt >= H_ACTIVE + H_FP and h_cnt < H_ACTIVE + H_FP + H_SYNC) else '1';
    vga_vs <= '0' when (v_cnt >= V_ACTIVE + V_FP and v_cnt < V_ACTIVE + V_FP + V_SYNC) else '1';

    -- VGA-kleuren (testbeeld)
    process(h_cnt, v_cnt)
    begin
        if h_cnt < H_ACTIVE and v_cnt < V_ACTIVE then
            if (v_cnt < 342) then
                vga_r <= "1111";  -- Rood raster
                vga_g <= "0000";
                vga_b <= "0000";
            elsif (v_cnt <683 ) then
                vga_r <= "1111";  -- Groen scherm
                vga_g <= "1111";
                vga_b <= "1111";
            else 
                vga_r <= "0000";  -- Groen scherm
                vga_g <= "0000";
                vga_b <= "1111";
            end if;
        else
            vga_r <= "0000";
            vga_g <= "0000";
            vga_b <= "0000";
        end if;
    end process;

end Behavioral;
