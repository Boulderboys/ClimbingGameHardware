set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_microblaze_riscv_0_0/bd_microblaze_microblaze_riscv_0_0.xdc rfile:../vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_microblaze_riscv_0_0/bd_microblaze_microblaze_riscv_0_0.xdc id:1 order:EARLY scoped_inst:Microblaze/Microblaze/bd_microblaze_i/microblaze_riscv_0/U0} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_clk_wiz_1_0/bd_microblaze_clk_wiz_1_0_board.xdc rfile:../vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_clk_wiz_1_0/bd_microblaze_clk_wiz_1_0_board.xdc id:2 order:EARLY used_in_board:yes scoped_inst:Microblaze/Microblaze/bd_microblaze_i/clk_wiz_1/inst prop_thru_buffer:yes} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_clk_wiz_1_0/bd_microblaze_clk_wiz_1_0.xdc rfile:../vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_clk_wiz_1_0/bd_microblaze_clk_wiz_1_0.xdc id:3 order:EARLY scoped_inst:Microblaze/Microblaze/bd_microblaze_i/clk_wiz_1/inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_rst_clk_wiz_1_100M_0/bd_microblaze_rst_clk_wiz_1_100M_0.xdc rfile:../vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_rst_clk_wiz_1_100M_0/bd_microblaze_rst_clk_wiz_1_100M_0.xdc id:4 order:EARLY scoped_inst:Microblaze/Microblaze/bd_microblaze_i/rst_clk_wiz_1_100M/U0} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/ips/clk_wiz_0/clk_wiz_0.xdc rfile:../ips/clk_wiz_0/clk_wiz_0.xdc id:5 order:EARLY scoped_inst:clk_wiz/inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/src/vhdl/OV7670/ip/clk_gen/clk_generator_1/clk_generator.xdc rfile:../src/vhdl/OV7670/ip/clk_gen/clk_generator_1/clk_generator.xdc id:6 order:EARLY scoped_inst:camera/xclk_pll/inst} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/src/vhdl/OV7670/ip/vga_clk/vga_clk_gen/vga_clk_gen.xdc rfile:../src/vhdl/OV7670/ip/vga_clk/vga_clk_gen/vga_clk_gen.xdc id:7 order:EARLY scoped_inst:camera/vga_pll/inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/src/constraints/Nexys_A7_100T-Master.xdc rfile:../src/constraints/Nexys_A7_100T-Master.xdc id:8} [current_design]
set_property SRC_FILE_INFO {cfile:c:/Users/jacco/User_Documents/KBSVivado/Boulderboys/hardware/vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_mdm_1_0/bd_microblaze_mdm_1_0.xdc rfile:../vivado_project/ClimbingGameHardware.gen/sources_1/bd/bd_microblaze/ip/bd_microblaze_mdm_1_0/bd_microblaze_mdm_1_0.xdc id:9 order:LATE scoped_inst:Microblaze/Microblaze/bd_microblaze_i/mdm_1/U0} [current_design]
current_instance Microblaze/Microblaze/bd_microblaze_i/microblaze_riscv_0/U0
set_property src_info {type:SCOPED_XDC file:1 line:4 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-3  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/C]
set_property src_info {type:SCOPED_XDC file:1 line:11 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/D]
set_property src_info {type:SCOPED_XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CE]
set_property src_info {type:SCOPED_XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/*/D]
set_property src_info {type:SCOPED_XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]
set_property src_info {type:SCOPED_XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/PRE]
set_property src_info {type:SCOPED_XDC file:1 line:16 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user microblaze_riscv -tags IPCPG-502 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet riscv_core_I/*.Core/*Debug_Logic.Master_Core.Debug*/Serial_Dbg_Intf.*/CLR]
current_instance
current_instance Microblaze/Microblaze/bd_microblaze_i/clk_wiz_1/inst
set_property src_info {type:SCOPED_XDC file:2 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property BOARD_PART_PIN {clk} [get_ports clk_in1]
set_property src_info {type:SCOPED_XDC file:3 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
current_instance Microblaze/Microblaze/bd_microblaze_i/rst_clk_wiz_1_100M/U0
set_property src_info {type:SCOPED_XDC file:4 line:50 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -type CDC -id {CDC-11} -user "proc_sys_reset" -desc "Timing uncritical paths" -tags "1171415" -scope -internal -to [get_pins -quiet -filter REF_PIN_NAME=~*D -of_objects [get_cells -hierarchical -filter {NAME =~ */ACTIVE_LOW_AUX.ACT_LO_AUX/GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to}]]
current_instance
current_instance clk_wiz/inst
set_property src_info {type:SCOPED_XDC file:5 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
current_instance camera/xclk_pll/inst
set_property src_info {type:SCOPED_XDC file:6 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
current_instance camera/vga_pll/inst
set_property src_info {type:SCOPED_XDC file:7 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.100
current_instance
set_property src_info {type:XDC file:8 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { LED16_B }]; #IO_L5P_T0_D06_14 Sch=led16_b
set_property src_info {type:XDC file:8 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LED16_G }]; #IO_L10P_T1_D14_14 Sch=led16_g
set_property src_info {type:XDC file:8 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]; #IO_L11P_T1_SRCC_14 Sch=led16_r
set_property src_info {type:XDC file:8 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED17_B }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=led17_b
set_property src_info {type:XDC file:8 line:53 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { LED17_G }]; #IO_0_14 Sch=led17_g
set_property src_info {type:XDC file:8 line:54 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED17_R }]; #IO_L11N_T1_SRCC_14 Sch=led17_r
set_property src_info {type:XDC file:8 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { CA }]; #IO_L24N_T3_A00_D16_14 Sch=ca
set_property src_info {type:XDC file:8 line:58 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { CB }]; #IO_25_14 Sch=cb
set_property src_info {type:XDC file:8 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { CC }]; #IO_25_15 Sch=cc
set_property src_info {type:XDC file:8 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { CD }]; #IO_L17P_T2_A26_15 Sch=cd
set_property src_info {type:XDC file:8 line:61 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { CE }]; #IO_L13P_T2_MRCC_14 Sch=ce
set_property src_info {type:XDC file:8 line:62 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { CF }]; #IO_L19P_T3_A10_D26_14 Sch=cf
set_property src_info {type:XDC file:8 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { CG }]; #IO_L4P_T0_D04_14 Sch=cg
set_property src_info {type:XDC file:8 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp
set_property src_info {type:XDC file:8 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
set_property src_info {type:XDC file:8 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
set_property src_info {type:XDC file:8 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
set_property src_info {type:XDC file:8 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
set_property src_info {type:XDC file:8 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
set_property src_info {type:XDC file:8 line:70 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
set_property src_info {type:XDC file:8 line:71 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]; #IO_L23P_T3_35 Sch=an[6]
set_property src_info {type:XDC file:8 line:72 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]
set_property src_info {type:XDC file:8 line:82 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { BTND }]; #IO_L9N_T1_DQS_D13_14 Sch=btnd
set_property src_info {type:XDC file:8 line:109 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]; #IO_L23N_T3_35 Sch=jc[1]
set_property src_info {type:XDC file:8 line:110 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]; #IO_L19N_T3_VREF_35 Sch=jc[2]
set_property src_info {type:XDC file:8 line:111 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]; #IO_L22N_T3_35 Sch=jc[3]
set_property src_info {type:XDC file:8 line:112 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]; #IO_L19P_T3_35 Sch=jc[4]
set_property src_info {type:XDC file:8 line:113 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]; #IO_L6P_T0_35 Sch=jc[7]
set_property src_info {type:XDC file:8 line:114 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { JC[8] }]; #IO_L22P_T3_35 Sch=jc[8]
set_property src_info {type:XDC file:8 line:115 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { JC[9] }]; #IO_L21P_T3_DQS_35 Sch=jc[9]
set_property src_info {type:XDC file:8 line:116 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { JC[10] }]; #IO_L5P_T0_AD13P_35 Sch=jc[10]
set_property src_info {type:XDC file:8 line:119 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]; #IO_L21N_T3_DQS_35 Sch=jd[1]
set_property src_info {type:XDC file:8 line:120 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]; #IO_L17P_T2_35 Sch=jd[2]
set_property src_info {type:XDC file:8 line:121 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]; #IO_L17N_T2_35 Sch=jd[3]
set_property src_info {type:XDC file:8 line:122 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]; #IO_L20N_T3_35 Sch=jd[4]
set_property src_info {type:XDC file:8 line:123 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]; #IO_L15P_T2_DQS_35 Sch=jd[7]
set_property src_info {type:XDC file:8 line:124 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { JD[8] }]; #IO_L20P_T3_35 Sch=jd[8]
set_property src_info {type:XDC file:8 line:125 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { JD[9] }]; #IO_L15N_T2_DQS_35 Sch=jd[9]
set_property src_info {type:XDC file:8 line:126 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { JD[10] }]; #IO_L13N_T2_MRCC_35 Sch=jd[10]
set_property src_info {type:XDC file:8 line:129 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { XA_N[1] }]; #IO_L9N_T1_DQS_AD3N_15 Sch=xa_n[1]
set_property src_info {type:XDC file:8 line:130 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { XA_P[1] }]; #IO_L9P_T1_DQS_AD3P_15 Sch=xa_p[1]
set_property src_info {type:XDC file:8 line:131 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { XA_N[2] }]; #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
set_property src_info {type:XDC file:8 line:132 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { XA_P[2] }]; #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
set_property src_info {type:XDC file:8 line:133 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { XA_N[3] }]; #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
set_property src_info {type:XDC file:8 line:134 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { XA_P[3] }]; #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
set_property src_info {type:XDC file:8 line:135 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { XA_N[4] }]; #IO_L10N_T1_AD11N_15 Sch=xa_n[4]
set_property src_info {type:XDC file:8 line:136 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { XA_P[4] }]; #IO_L10P_T1_AD11P_15 Sch=xa_p[4]
set_property src_info {type:XDC file:8 line:155 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }]; #IO_L14P_T2_SRCC_35 Sch=sd_reset
set_property src_info {type:XDC file:8 line:156 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { SD_CD }]; #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
set_property src_info {type:XDC file:8 line:157 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }]; #IO_L9P_T1_DQS_AD7P_35 Sch=sd_sck
set_property src_info {type:XDC file:8 line:158 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }]; #IO_L16N_T2_35 Sch=sd_cmd
set_property src_info {type:XDC file:8 line:159 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; #IO_L16P_T2_35 Sch=sd_dat[0]
set_property src_info {type:XDC file:8 line:160 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; #IO_L18N_T2_35 Sch=sd_dat[1]
set_property src_info {type:XDC file:8 line:161 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; #IO_L18P_T2_35 Sch=sd_dat[2]
set_property src_info {type:XDC file:8 line:162 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; #IO_L14N_T2_SRCC_35 Sch=sd_dat[3]
set_property src_info {type:XDC file:8 line:165 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
set_property src_info {type:XDC file:8 line:166 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
set_property src_info {type:XDC file:8 line:167 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
set_property src_info {type:XDC file:8 line:168 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN }]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
set_property src_info {type:XDC file:8 line:169 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]; #IO_L2P_T0_AD8P_15 Sch=acl_int[1]
set_property src_info {type:XDC file:8 line:170 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]; #IO_L20P_T3_A20_15 Sch=acl_int[2]
set_property src_info {type:XDC file:8 line:173 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }]; #IO_L1N_T0_AD0N_15 Sch=tmp_scl
set_property src_info {type:XDC file:8 line:174 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }]; #IO_L12N_T1_MRCC_15 Sch=tmp_sda
set_property src_info {type:XDC file:8 line:175 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { TMP_INT }]; #IO_L6N_T0_VREF_15 Sch=tmp_int
set_property src_info {type:XDC file:8 line:176 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B14   IOSTANDARD LVCMOS33 } [get_ports { TMP_CT }]; #IO_L2N_T0_AD8N_15 Sch=tmp_ct
set_property src_info {type:XDC file:8 line:179 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { M_CLK }]; #IO_25_35 Sch=m_clk
set_property src_info {type:XDC file:8 line:180 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { M_DATA }]; #IO_L24N_T3_35 Sch=m_data
set_property src_info {type:XDC file:8 line:181 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { M_LRSEL }]; #IO_0_35 Sch=m_lrsel
set_property src_info {type:XDC file:8 line:184 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]; #IO_L4N_T0_15 Sch=aud_pwm
set_property src_info {type:XDC file:8 line:185 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]; #IO_L6P_T0_15 Sch=aud_sd
set_property src_info {type:XDC file:8 line:188 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
set_property src_info {type:XDC file:8 line:189 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
set_property src_info {type:XDC file:8 line:190 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
set_property src_info {type:XDC file:8 line:191 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts
set_property src_info {type:XDC file:8 line:194 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { PS2_CLK }]; #IO_L13P_T2_MRCC_35 Sch=ps2_clk
set_property src_info {type:XDC file:8 line:195 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA }]; #IO_L10N_T1_AD15N_35 Sch=ps2_data
set_property src_info {type:XDC file:8 line:198 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }]; #IO_L11P_T1_SRCC_16 Sch=eth_mdc
set_property src_info {type:XDC file:8 line:199 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO }]; #IO_L14N_T2_SRCC_16 Sch=eth_mdio
set_property src_info {type:XDC file:8 line:200 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN }]; #IO_L10P_T1_AD15P_35 Sch=eth_rstn
set_property src_info {type:XDC file:8 line:201 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { ETH_CRSDV }]; #IO_L6N_T0_VREF_16 Sch=eth_crsdv
set_property src_info {type:XDC file:8 line:202 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXERR }]; #IO_L13N_T2_MRCC_16 Sch=eth_rxerr
set_property src_info {type:XDC file:8 line:203 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }]; #IO_L13P_T2_MRCC_16 Sch=eth_rxd[0]
set_property src_info {type:XDC file:8 line:204 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }]; #IO_L19N_T3_VREF_16 Sch=eth_rxd[1]
set_property src_info {type:XDC file:8 line:205 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXEN }]; #IO_L11N_T1_SRCC_16 Sch=eth_txen
set_property src_info {type:XDC file:8 line:206 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }]; #IO_L14P_T2_SRCC_16 Sch=eth_txd[0]
set_property src_info {type:XDC file:8 line:207 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }]; #IO_L12N_T1_MRCC_16 Sch=eth_txd[1]
set_property src_info {type:XDC file:8 line:208 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ETH_REFCLK }]; #IO_L11P_T1_SRCC_35 Sch=eth_refclk
set_property src_info {type:XDC file:8 line:209 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }]; #IO_L12P_T1_MRCC_16 Sch=eth_intn
set_property src_info {type:XDC file:8 line:212 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
set_property src_info {type:XDC file:8 line:213 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
set_property src_info {type:XDC file:8 line:214 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
set_property src_info {type:XDC file:8 line:215 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]
set_property src_info {type:XDC file:8 line:216 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_csn
current_instance Microblaze/Microblaze/bd_microblaze_i/mdm_1/U0
set_property src_info {type:SCOPED_XDC file:9 line:17 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:9 line:20 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins "Use*.BSCAN*/*/DRCK"]] -description "Avoid warning for valid DRCK clock constraint"
set_property src_info {type:SCOPED_XDC file:9 line:23 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins "Use*.BSCAN*/*/UPDATE"]] -description "Avoid warning for valid UPDATE clock constraint"
set_property src_info {type:SCOPED_XDC file:9 line:26 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins "Use*.BSCAN*/*/TCK"]] -description "Avoid warning for valid TCK clock constraint"
set_property src_info {type:SCOPED_XDC file:9 line:29 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -scoped -user mdm_riscv -tags IPCPG-503 -type METHODOLOGY -id TIMING-54 -object [get_clocks -quiet -of_objects [get_pins */*/*.BUFG_UPDATE/*/O]] -description "Avoid warning for valid UPDATE clock constraint"
set_property src_info {type:SCOPED_XDC file:9 line:34 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:9 line:35 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:9 line:36 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:37 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/UPDATE]
set_property src_info {type:SCOPED_XDC file:9 line:38 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/CE]
set_property src_info {type:SCOPED_XDC file:9 line:39 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/D]
set_property src_info {type:SCOPED_XDC file:9 line:40 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/R]
set_property src_info {type:SCOPED_XDC file:9 line:41 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/CE]
set_property src_info {type:SCOPED_XDC file:9 line:42 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/D]
set_property src_info {type:SCOPED_XDC file:9 line:43 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/R]
set_property src_info {type:SCOPED_XDC file:9 line:44 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-2  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:45 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-7  -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:46 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-10 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:47 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-11 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:48 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:9 line:49 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/*/O]
set_property src_info {type:SCOPED_XDC file:9 line:50 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-13 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:9 line:51 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/C]
set_property src_info {type:SCOPED_XDC file:9 line:52 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TDI]
set_property src_info {type:SCOPED_XDC file:9 line:53 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/INTERNAL_TCK]
set_property src_info {type:SCOPED_XDC file:9 line:54 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -from [get_pins -quiet Use_E2.BSCAN_I/Use_E2.BSCANE2_I/UPDATE]
set_property src_info {type:SCOPED_XDC file:9 line:55 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet MDM_Core_I1/JTAG_CONTROL_I/*/R]
set_property src_info {type:SCOPED_XDC file:9 line:56 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-15 -description "Debug protocol ensures stable signals" -to [get_pins -quiet Use_JTAG_BSCAN.*/R]
set_property src_info {type:SCOPED_XDC file:9 line:58 export:INPUT save:INPUT read:READ} [current_design]
create_waiver -internal -quiet -user mdm_riscv -tags IPCPG-503 -type CDC -id CDC-1  -description "Debug protocol ensures stable signals" -to [get_pins -quiet Internal_BSCANID.bscanid*reg/D]
