// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of x
//        bit 31~0 - x[31:0] (Read/Write)
// 0x14 : reserved
// 0x18 : Data signal of y
//        bit 31~0 - y[31:0] (Read/Write)
// 0x1c : reserved
// 0x20 : Data signal of r
//        bit 31~0 - r[31:0] (Read)
// 0x24 : Control signal of r
//        bit 0  - r_ap_vld (Read/COR)
//        others - reserved
// 0x30 : Data signal of theta
//        bit 31~0 - theta[31:0] (Read)
// 0x34 : Control signal of theta
//        bit 0  - theta_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XCORDICCART2POL_CONTROL_ADDR_X_DATA     0x10
#define XCORDICCART2POL_CONTROL_BITS_X_DATA     32
#define XCORDICCART2POL_CONTROL_ADDR_Y_DATA     0x18
#define XCORDICCART2POL_CONTROL_BITS_Y_DATA     32
#define XCORDICCART2POL_CONTROL_ADDR_R_DATA     0x20
#define XCORDICCART2POL_CONTROL_BITS_R_DATA     32
#define XCORDICCART2POL_CONTROL_ADDR_R_CTRL     0x24
#define XCORDICCART2POL_CONTROL_ADDR_THETA_DATA 0x30
#define XCORDICCART2POL_CONTROL_BITS_THETA_DATA 32
#define XCORDICCART2POL_CONTROL_ADDR_THETA_CTRL 0x34

