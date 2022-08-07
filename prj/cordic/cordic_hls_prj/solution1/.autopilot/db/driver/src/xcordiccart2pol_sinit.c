// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xcordiccart2pol.h"

extern XCordiccart2pol_Config XCordiccart2pol_ConfigTable[];

XCordiccart2pol_Config *XCordiccart2pol_LookupConfig(u16 DeviceId) {
	XCordiccart2pol_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCORDICCART2POL_NUM_INSTANCES; Index++) {
		if (XCordiccart2pol_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XCordiccart2pol_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XCordiccart2pol_Initialize(XCordiccart2pol *InstancePtr, u16 DeviceId) {
	XCordiccart2pol_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XCordiccart2pol_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XCordiccart2pol_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

