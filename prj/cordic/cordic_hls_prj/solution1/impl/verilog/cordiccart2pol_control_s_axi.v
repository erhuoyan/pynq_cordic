// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module cordiccart2pol_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 6,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire [31:0]                   x,
    output wire [31:0]                   y,
    input  wire [31:0]                   r,
    input  wire                          r_ap_vld,
    input  wire [31:0]                   theta,
    input  wire                          theta_ap_vld
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_X_DATA_0     = 6'h10,
    ADDR_X_CTRL       = 6'h14,
    ADDR_Y_DATA_0     = 6'h18,
    ADDR_Y_CTRL       = 6'h1c,
    ADDR_R_DATA_0     = 6'h20,
    ADDR_R_CTRL       = 6'h24,
    ADDR_THETA_DATA_0 = 6'h30,
    ADDR_THETA_CTRL   = 6'h34,
    WRIDLE            = 2'd0,
    WRDATA            = 2'd1,
    WRRESP            = 2'd2,
    WRRESET           = 2'd3,
    RDIDLE            = 2'd0,
    RDDATA            = 2'd1,
    RDRESET           = 2'd2,
    ADDR_BITS                = 6;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [31:0]                   int_x = 'b0;
    reg  [31:0]                   int_y = 'b0;
    reg  [31:0]                   int_r = 'b0;
    reg                           int_r_ap_vld;
    reg  [31:0]                   int_theta = 'b0;
    reg                           int_theta_ap_vld;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_X_DATA_0: begin
                    rdata <= int_x[31:0];
                end
                ADDR_Y_DATA_0: begin
                    rdata <= int_y[31:0];
                end
                ADDR_R_DATA_0: begin
                    rdata <= int_r[31:0];
                end
                ADDR_R_CTRL: begin
                    rdata[0] <= int_r_ap_vld;
                end
                ADDR_THETA_DATA_0: begin
                    rdata <= int_theta[31:0];
                end
                ADDR_THETA_CTRL: begin
                    rdata[0] <= int_theta_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign x = int_x;
assign y = int_y;
// int_x[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_x[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_X_DATA_0)
            int_x[31:0] <= (WDATA[31:0] & wmask) | (int_x[31:0] & ~wmask);
    end
end

// int_y[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_y[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_Y_DATA_0)
            int_y[31:0] <= (WDATA[31:0] & wmask) | (int_y[31:0] & ~wmask);
    end
end

// int_r
always @(posedge ACLK) begin
    if (ARESET)
        int_r <= 0;
    else if (ACLK_EN) begin
        if (r_ap_vld)
            int_r <= r;
    end
end

// int_r_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_r_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (r_ap_vld)
            int_r_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_R_CTRL)
            int_r_ap_vld <= 1'b0; // clear on read
    end
end

// int_theta
always @(posedge ACLK) begin
    if (ARESET)
        int_theta <= 0;
    else if (ACLK_EN) begin
        if (theta_ap_vld)
            int_theta <= theta;
    end
end

// int_theta_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_theta_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (theta_ap_vld)
            int_theta_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_THETA_CTRL)
            int_theta_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------

endmodule
