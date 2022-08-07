// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XCORDICCART2POL_H
#define XCORDICCART2POL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xcordiccart2pol_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XCordiccart2pol_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XCordiccart2pol;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XCordiccart2pol_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XCordiccart2pol_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XCordiccart2pol_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XCordiccart2pol_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XCordiccart2pol_Initialize(XCordiccart2pol *InstancePtr, u16 DeviceId);
XCordiccart2pol_Config* XCordiccart2pol_LookupConfig(u16 DeviceId);
int XCordiccart2pol_CfgInitialize(XCordiccart2pol *InstancePtr, XCordiccart2pol_Config *ConfigPtr);
#else
int XCordiccart2pol_Initialize(XCordiccart2pol *InstancePtr, const char* InstanceName);
int XCordiccart2pol_Release(XCordiccart2pol *InstancePtr);
#endif


void XCordiccart2pol_Set_x(XCordiccart2pol *InstancePtr, u32 Data);
u32 XCordiccart2pol_Get_x(XCordiccart2pol *InstancePtr);
void XCordiccart2pol_Set_y(XCordiccart2pol *InstancePtr, u32 Data);
u32 XCordiccart2pol_Get_y(XCordiccart2pol *InstancePtr);
u32 XCordiccart2pol_Get_r(XCordiccart2pol *InstancePtr);
u32 XCordiccart2pol_Get_r_vld(XCordiccart2pol *InstancePtr);
u32 XCordiccart2pol_Get_theta(XCordiccart2pol *InstancePtr);
u32 XCordiccart2pol_Get_theta_vld(XCordiccart2pol *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
