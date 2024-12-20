// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1.2 (win64) Build 5164865 Thu Sep  5 14:37:11 MDT 2024
// Date        : Thu Dec 19 14:00:02 2024
// Host        : JACCO-GIGABYTE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top blk_mem_gen_1 -prefix
//               blk_mem_gen_1_ blk_mem_gen_1_stub.v
// Design      : blk_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_8,Vivado 2024.1.2" *)
module blk_mem_gen_1(clka, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="wea[0:0],addra[18:0],dina[7:0],enb,addrb[18:0],doutb[7:0]" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input [0:0]wea;
  input [18:0]addra;
  input [7:0]dina;
  input clkb /* synthesis syn_isclock = 1 */;
  input enb;
  input [18:0]addrb;
  output [7:0]doutb;
endmodule
