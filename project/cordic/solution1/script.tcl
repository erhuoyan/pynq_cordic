############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project cordic
set_top cordiccart2pol
add_files ../src/cordiccart2pol.cpp
add_files ../src/cordiccart2pol.h
add_files -tb ../src/cordiccart2pol_test.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./cordic/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
