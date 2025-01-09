LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY OV7670Top IS
    PORT (
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
        --sseg_o : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        --sseg_cs_o : OUT STD_LOGIC;
        VGA_HS_O : OUT STD_LOGIC;
        VGA_VS_O : OUT STD_LOGIC;
        VGA_R : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_B : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        VGA_G : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
        frame_buffer_out_processing : OUT STD_LOGIC_VECTOR(11 DOWNTO 0);
        frame_buffer_to_vga : IN STD_LOGIC
    );
END OV7670Top;

ARCHITECTURE rtl OF OV7670Top IS

    --hallo
    SIGNAL rst : STD_LOGIC := '0';
    SIGNAL edge : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL frame_buffer_out_vga : STD_LOGIC_VECTOR(0 DOWNTO 0);

    SIGNAL pxl_clk : STD_LOGIC := '0';
    
    COMPONENT SobelFilter
    PORT (
        CLK : in STD_LOGIC;
        RESET : in STD_LOGIC;
        PIXEL_IN : in STD_LOGIC_VECTOR(11 downto 0);
        VALID_IN : in STD_LOGIC;
        PIXEL_OUT : out STD_LOGIC;
        VALID_OUT : out STD_LOGIC
    );
    END COMPONENT;

    
    COMPONENT Greyscale
    port (
        data_in : in std_logic_vector(11 downto 0);
        data_out : out std_logic_vector (11 downto 0));
    end component;

    
    COMPONENT clk_generator
        PORT (
            reset : IN STD_LOGIC;
            clk_in1 : IN STD_LOGIC;
            locked : OUT STD_LOGIC;
            o_xclk_ov7670 : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT vga_clk_gen IS
        PORT (
            clk_in1 : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            clk_out1 : OUT STD_LOGIC;
            locked : OUT STD_LOGIC
        );
    END COMPONENT;
    
    --camera to filter
    COMPONENT blk_mem_gen_1 IS
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
            clkb : IN STD_LOGIC;
            enb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
        );
    END COMPONENT;
    
        --filter to vga
        COMPONENT blk_mem_gen_0 IS 
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            clkb : IN STD_LOGIC;
            addrb : IN STD_LOGIC_VECTOR(18 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
        );
    END COMPONENT;
    
    
    SIGNAL sobel_pixel_in : STD_LOGIC_VECTOR(11 downto 0);
    SIGNAL sobel_pixel_out : STD_LOGIC_vector(0 downto 0 );
    SIGNAL sobel_valid_in : STD_LOGIC := '0';
    SIGNAL sobel_valid_out : STD_LOGIC := '0';
    SIGNAL reset_sobel : STD_LOGIC := '0';

    SIGNAL sseg_byte : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL config_finished : STD_LOGIC := '0';

    SIGNAL buf1_vsync, buf2_vsync, buf1_href, buf2_href : STD_LOGIC := '0';
    SIGNAL buf1_pclk, buf2_pclk : STD_LOGIC := '0';
    SIGNAL buf1_data, buf2_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

    SIGNAL vga_640x480_clk : STD_LOGIC := '0';
    SIGNAL xclk_ov7670 : STD_LOGIC := '0';

    SIGNAL pixel_data : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL ena1 : STD_LOGIC := '0';
    SIGNAL wea1 : STD_LOGIC_VECTOR(0 DOWNTO 0) := (OTHERS => '0');
    SIGNAL addra1 : STD_LOGIC_VECTOR(18 DOWNTO 0) := (OTHERS => '0');
    SIGNAL dina1 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
    SIGNAL greydina1 : std_logic_vector(11 downto 0) := (OTHERS => '0');
    SIGNAL enb1 : STD_LOGIC := '0';
    SIGNAL addrb1 : STD_LOGIC_VECTOR(18 DOWNTO 0) := (OTHERS => '0');
    SIGNAL doutb1 : STD_LOGIC_VECTOR(11 DOWNTO 0) := (OTHERS => '0');
     

    SIGNAL frame_finished : STD_LOGIC := '0';
BEGIN

    --?? metastability of external signals
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            if frame_buffer_to_vga = '0' then
                frame_buffer_out_processing <= doutb1;
                frame_buffer_out_vga(0) <= '0';
            else
                frame_buffer_out_processing <= (others => '0');
                
                frame_buffer_out_vga <= sobel_pixel_out;
            end if;
            buf1_vsync <= ov7670_vsync;
            buf2_vsync <= buf1_vsync;

            buf1_href <= ov7670_href;
            buf2_href <= buf1_href;

            buf1_pclk <= ov7670_pclk;
            buf2_pclk <= buf1_pclk;

            buf1_data <= ov7670_data;
            buf2_data <= buf1_data;

        END IF;
    END PROCESS;

    rst <= '0';

    ov7670_pwdn <= '0'; -- Power device up

    xclk_pll : clk_generator
    PORT MAP(
        clk_in1 => clk,
        o_xclk_ov7670 => xclk_ov7670,
        reset => '0',
        locked => OPEN
    );

    vga_pll : vga_clk_gen
    PORT MAP
    (-- Clock in ports
        clk_in1 => clk,
        reset => '0',
        locked => OPEN,
        -- Clock out ports
        clk_out1 => pxl_clk
    );

    ov7670_xclk <= xclk_ov7670;



    ov7670_configuration : ENTITY work.ov7670_configuration(Behavioral)
        PORT MAP(
            clk => clk,
            rst => rst,
            sda => sda,
            edge => edge,
            scl => scl,
            ov7670_reset => ov7670_reset,
            start => edge(0),
            ack_err => OPEN,
            done => OPEN,
            config_finished => config_finished,
            reg_value => OPEN
        );
        
    Sobel : SobelFilter
    port map
    (
        CLK => clk,
        RESET => '0',
        PIXEL_IN => sobel_pixel_in,
        VALID_IN => '1',
        PIXEL_OUT => sobel_pixel_out(0),
        VALID_OUT => sobel_valid_out
    );
    
    
    Grey: Greyscale 
    port map
    (
        data_in => dina1, 
        data_out => greydina1
    );
    
    --dual port bram ---- camera in filter out
    frame_buffer : blk_mem_gen_1
    PORT MAP(
        clka => clk,
        wea => wea1,
--        ena => '1',
        addra => addra1,
        dina => greydina1,
        clkb => pxl_clk,
        enb => '1',
        addrb => addrb1,
        doutb => sobel_pixel_in
    );
    
    
    ov7670_capture : ENTITY work.ov7670_capture(rtl) PORT MAP(
        clk => clk,
        rst => rst,
        config_finished => config_finished,
        ov7670_vsync => buf2_vsync,
        ov7670_href => buf2_href,
        ov7670_pclk => buf2_pclk,
        ov7670_data => buf2_data,
        frame_finished_o => frame_finished,
        pixel_data => pixel_data,
        start => edge(3),
        
        --frame_buffer signals
        wea => wea1,
        dina => dina1,
        addra => addra1
        );

    EDGE_DETECT : ENTITY work.debounce(Behavioral) PORT MAP(
        clk => clk,
        btn => btn,
        edge => edge
        );
        
    
    vga_controller : ENTITY work.vga_controller(rtl)
        PORT MAP(
            clk => clk,
            rst => rst,
            pxl_clk => pxl_clk,
            start => frame_buffer_to_vga,
            VGA_HS_O => VGA_HS_O,
            VGA_VS_O => VGA_VS_O,
            VGA_R => VGA_R,
            VGA_G => VGA_G,
            VGA_B => VGA_B,
            
            --frame_buffer signals 
            addrb => addrb1,
            doutb => frame_buffer_out_vga
        );


END ARCHITECTURE;