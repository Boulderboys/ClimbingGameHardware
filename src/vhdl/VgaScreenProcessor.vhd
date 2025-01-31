library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity VgaScreenProcessor is
    Port (
        vga_r : out std_logic_vector(3 downto 0);
        vga_g : out std_logic_vector(3 downto 0);
        vga_b : out std_logic_vector(3 downto 0);
        vga_hs : out std_logic;
        vga_vs : out std_logic;
        clk : in std_logic;
--        reset : in std_logic;
        bram_addr   : out std_logic_vector(18 downto 0) := (others => '0');
        bram_data   : in  std_logic_vector(11 downto 0)
    );
end VgaScreenProcessor;

architecture Behavioral of VgaScreenProcessor is

    signal h_cnt : unsigned(10 downto 0) := (others => '0');
    signal v_cnt : unsigned(10 downto 0) := (others => '0');
    
    constant H_ACTIVE    : integer := 640;
    constant H_FP        : integer := 16;
    constant H_SYNC      : integer := 96;
    constant H_BP        : integer := 48;
    constant H_TOTAL     : integer := 800;
    

    constant V_ACTIVE    : integer := 480;
    constant V_FP        : integer := 10;
    constant V_SYNC      : integer := 2;
    constant V_BP        : integer := 33;
    constant V_TOTAL     : integer := 525;
    
    constant Picture_size : integer := 307200;
   
    
begin                 
    -- Horizontale en verticale teller
 counters:   process(clk)
    begin
        if false  then
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
            bram_addr <= std_logic_vector(
                resize(v_cnt * to_unsigned(H_ACTIVE, v_cnt'length) + h_cnt, bram_addr'length)
            );
        end if;
    end process;
    -- Synchronisatiesignalen
    vga_hs <= '0' when (h_cnt >= H_ACTIVE + H_FP and h_cnt < H_ACTIVE + H_FP + H_SYNC) else '1';
    vga_vs <= '0' when (v_cnt >= V_ACTIVE + V_FP and v_cnt < V_ACTIVE + V_FP + V_SYNC) else '1';
    
VGAdraw : process(h_cnt, v_cnt, clk)
begin
    if rising_edge(clk) then
        
        if h_cnt < H_ACTIVE and v_cnt < V_ACTIVE then          
            vga_r(3 downto 0) <= bram_data(11 downto 8 );
            vga_g(3 downto 0) <= bram_data(7 downto 4 );
            vga_b(3 downto 0) <= bram_data(3 downto 0 );
        else
            vga_r <= (others => '0');
            vga_g <= (others => '0');
            vga_b <= (others => '0');
        end if;
        
     end if;
end process;
    

end Behavioral;
