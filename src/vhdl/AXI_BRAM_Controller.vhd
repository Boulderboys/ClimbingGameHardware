library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity AXI_BRAM_Controller is
    -- BRAM constants
    generic (
        C_S_AXI_DATA_WIDTH    : integer := 32;
        C_S_AXI_ADDR_WIDTH    : integer := 19;
        C_MEMORY_DEPTH        : integer := 307200;
        C_S_BRAM_DATA_WIDTH   : integer := 8
    );
    port (
        -- AXI4-Lite slave signals
        s_axi_aclk    : in std_logic;
        s_axi_aresetn : in std_logic;
        s_axi_awaddr  : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        s_axi_awvalid : in std_logic;
        s_axi_awready : out std_logic;
        s_axi_wdata   : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
        s_axi_wstrb   : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
        s_axi_wvalid  : in std_logic;
        s_axi_wready  : out std_logic;
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in std_logic;
        -- BRAM interface
        bram_addr : out std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
        bram_clk  : out std_logic;
        bram_we   : out std_logic_vector(0 to 0);
        bram_din  : out std_logic_vector(C_S_BRAM_DATA_WIDTH -1 downto 0)
    );
end AXI_BRAM_Controller;
 
architecture Behavioral of AXI_BRAM_Controller is
    -- All possible states relating read and write opperations
    type state_type is (IDLE, WRITE_ADDR, WRITE_DATA, WRITE_RESP);
    signal state : state_type := IDLE;
    signal axi_awready : std_logic := '0';
    signal axi_wready  : std_logic := '0';
    signal axi_bvalid  : std_logic := '0';
    signal bram_addr_reg : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
    signal bram_we_reg   : std_logic_vector(0 downto 0) := (others => '0');
    signal bram_din_reg  : std_logic_vector(C_S_BRAM_DATA_WIDTH -1 downto 0) := (others => '0');
begin
    -- AXI4-Lite signal assignments
    s_axi_awready <= axi_awready;
    s_axi_wready <= axi_wready;
    s_axi_bresp <= "00"; -- OKAY response
    s_axi_bvalid <= axi_bvalid;
    -- BRAM interface assignments
    bram_addr <= bram_addr_reg;
    bram_clk  <= s_axi_aclk;
    bram_we   <= bram_we_reg;
    bram_din  <= bram_din_reg;
    -- Main process
    process(s_axi_aclk)
    begin
        if rising_edge(s_axi_aclk) then
            if s_axi_aresetn = '0' then
                state <= IDLE;
                axi_awready <= '0';
                axi_wready <= '0';
                axi_bvalid <= '0';
                bram_addr_reg <= (others => '0');
                bram_we_reg <= (others => '0');
                bram_din_reg <= (others => '0');
            else
                case state is
                    when IDLE =>
                        if s_axi_awvalid = '1' then
                            state <= WRITE_ADDR;
                            axi_awready <= '1';
                            bram_addr_reg <= s_axi_awaddr;
                        end if;
                    when WRITE_ADDR =>
                        axi_awready <= '0';
                        if s_axi_wvalid = '1' then
                            state <= WRITE_DATA;
                            axi_wready <= '1';
                            bram_we_reg <= (others => '1');
                            bram_din_reg <= s_axi_wdata(C_S_BRAM_DATA_WIDTH -1 downto 0);
                        end if;
                    when WRITE_DATA =>
                        axi_wready <= '0';
                        bram_we_reg <= (others => '0');
                        state <= WRITE_RESP;
                        axi_bvalid <= '1';
                    when WRITE_RESP =>
                        if s_axi_bready = '1' then
                            axi_bvalid <= '0';
                            state <= IDLE;
                        end if;
                end case;
            end if;
        end if;
    end process;
 
end Behavioral;