-makelib ies_lib/xilinx_vip -sv \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib ies_lib/xpm -sv \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/FPGATOOL/Xilinx2020/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/axi_infrastructure_v1_1_0 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_vip_v1_1_8 -sv \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/94c3/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib ies_lib/processing_system7_vip_v1_0_10 -sv \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/34f8/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_processing_system7_0_0/sim/design_1_processing_system7_0_0.v" \
-endlib
-makelib ies_lib/xbip_utils_v3_0_10 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/axi_utils_v2_0_6 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_pipe_v3_0_6 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_wrapper_v3_0_4 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_addsub_v3_0_6 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_dsp48_multadd_v3_0_6 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/b0ac/hdl/xbip_dsp48_multadd_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xbip_bram18k_v3_0_6 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/d367/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/mult_gen_v12_0_16 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/ce84/hdl/mult_gen_v12_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/floating_point_v7_1_11 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/b0c0/hdl/floating_point_v7_1_rfs.vhd" \
-endlib
-makelib ies_lib/floating_point_v7_1_11 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/b0c0/hdl/floating_point_v7_1_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_angles.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_control_s_axi.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_dmul_64ns_64ns_64_7_max_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_fadd_32ns_32ns_32_5_full_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_faddfsub_32ns_32ns_32_5_full_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_fcmp_32ns_32ns_1_2_no_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_fmul_32ns_32ns_32_4_max_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_fpext_32ns_64_2_no_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_fptrunc_64ns_32_2_no_dsp_1.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol_Kvalues.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/verilog/cordiccart2pol.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_dmul_5_max_dsp_64.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_faddfsub_3_full_dsp_32.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_fadd_3_full_dsp_32.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_fcmp_0_no_dsp_32.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_fmul_2_max_dsp_32.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_fpext_0_no_dsp_32.v" \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/4dc7/hdl/ip/cordiccart2pol_ap_fptrunc_0_no_dsp_64.v" \
  "../../../bd/design_1/ip/design_1_cordiccart2pol_0_0/sim/design_1_cordiccart2pol_0_0.v" \
-endlib
-makelib ies_lib/lib_cdc_v1_0_2 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies_lib/proc_sys_reset_v5_0_13 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_rst_ps7_0_50M_0/sim/design_1_rst_ps7_0_50M_0.vhd" \
-endlib
-makelib ies_lib/generic_baseblocks_v2_1_0 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib ies_lib/fifo_generator_v13_2_5 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib ies_lib/axi_data_fifo_v2_1_21 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_register_slice_v2_1_22 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/axi_protocol_converter_v2_1_22 \
  "../../../../cordic_vivado_prj.gen/sources_1/bd/design_1/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
  "../../../bd/design_1/sim/design_1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib
