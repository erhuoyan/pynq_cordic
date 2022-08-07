// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xcordiccart2pol.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XCordiccart2pol_CfgInitialize(XCordiccart2pol *InstancePtr, XCordiccart2pol_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XCordiccart2pol_Set_x(XCordiccart2pol *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCordiccart2pol_WriteReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_X_DATA, Data);
}

u32 XCordiccart2pol_Get_x(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_X_DATA);
    return Data;
}

void XCordiccart2pol_Set_y(XCordiccart2pol *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XCordiccart2pol_WriteReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_Y_DATA, Data);
}

u32 XCordiccart2pol_Get_y(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_Y_DATA);
    return Data;
}

u32 XCordiccart2pol_Get_r(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_R_DATA);
    return Data;
}

u32 XCordiccart2pol_Get_r_vld(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_R_CTRL);
    return Data & 0x1;
}

u32 XCordiccart2pol_Get_theta(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_THETA_DATA);
    return Data;
}

u32 XCordiccart2pol_Get_theta_vld(XCordiccart2pol *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XCordiccart2pol_ReadReg(InstancePtr->Control_BaseAddress, XCORDICCART2POL_CONTROL_ADDR_THETA_CTRL);
    return Data & 0x1;
}

