// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="cordiccart2pol_cordiccart2pol,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.256000,HLS_SYN_LAT=254,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1806,HLS_SYN_LUT=2937,HLS_VERSION=2020_2}" *)

module cordiccart2pol (
        ap_clk,
        ap_rst_n,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP
);

parameter    ap_ST_fsm_state1 = 29'd1;
parameter    ap_ST_fsm_state2 = 29'd2;
parameter    ap_ST_fsm_state3 = 29'd4;
parameter    ap_ST_fsm_state4 = 29'd8;
parameter    ap_ST_fsm_state5 = 29'd16;
parameter    ap_ST_fsm_state6 = 29'd32;
parameter    ap_ST_fsm_state7 = 29'd64;
parameter    ap_ST_fsm_state8 = 29'd128;
parameter    ap_ST_fsm_state9 = 29'd256;
parameter    ap_ST_fsm_state10 = 29'd512;
parameter    ap_ST_fsm_state11 = 29'd1024;
parameter    ap_ST_fsm_state12 = 29'd2048;
parameter    ap_ST_fsm_state13 = 29'd4096;
parameter    ap_ST_fsm_state14 = 29'd8192;
parameter    ap_ST_fsm_state15 = 29'd16384;
parameter    ap_ST_fsm_state16 = 29'd32768;
parameter    ap_ST_fsm_state17 = 29'd65536;
parameter    ap_ST_fsm_state18 = 29'd131072;
parameter    ap_ST_fsm_state19 = 29'd262144;
parameter    ap_ST_fsm_state20 = 29'd524288;
parameter    ap_ST_fsm_state21 = 29'd1048576;
parameter    ap_ST_fsm_state22 = 29'd2097152;
parameter    ap_ST_fsm_state23 = 29'd4194304;
parameter    ap_ST_fsm_state24 = 29'd8388608;
parameter    ap_ST_fsm_state25 = 29'd16777216;
parameter    ap_ST_fsm_state26 = 29'd33554432;
parameter    ap_ST_fsm_state27 = 29'd67108864;
parameter    ap_ST_fsm_state28 = 29'd134217728;
parameter    ap_ST_fsm_state29 = 29'd268435456;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;

 reg    ap_rst_n_inv;
wire   [31:0] x;
wire   [31:0] y;
wire   [31:0] r;
reg    r_ap_vld;
wire   [31:0] theta;
reg    theta_ap_vld;
wire   [3:0] Kvalues_address0;
reg    Kvalues_ce0;
wire   [31:0] Kvalues_q0;
wire   [3:0] angles_address0;
reg    angles_ce0;
wire   [31:0] angles_q0;
wire   [31:0] grp_fu_196_p2;
reg   [31:0] reg_225;
(* fsm_encoding = "none" *) reg   [28:0] ap_CS_fsm;
wire    ap_CS_fsm_state9;
wire    ap_CS_fsm_state13;
wire   [31:0] grp_fu_200_p2;
reg   [31:0] reg_231;
reg   [31:0] y_read_reg_408;
wire    ap_CS_fsm_state1;
reg   [31:0] x_read_reg_415;
wire   [0:0] grp_fu_213_p2;
reg   [0:0] tmp_1_reg_421;
wire    ap_CS_fsm_state2;
wire   [31:0] c_x_1_fu_300_p3;
wire    ap_CS_fsm_state3;
wire   [31:0] c_y_1_fu_307_p3;
wire   [31:0] angle_fu_314_p3;
wire   [4:0] add_ln33_fu_322_p2;
reg   [4:0] add_ln33_reg_441;
wire    ap_CS_fsm_state4;
wire   [0:0] icmp_ln33_fu_328_p2;
wire   [0:0] and_ln35_fu_376_p2;
reg   [0:0] and_ln35_reg_459;
wire    ap_CS_fsm_state5;
reg   [31:0] Kvalues_load_reg_465;
reg   [31:0] angles_load_reg_471;
wire   [31:0] select_ln41_fu_382_p3;
wire    ap_CS_fsm_state6;
wire   [31:0] select_ln42_fu_390_p3;
reg   [31:0] select_ln42_reg_481;
reg   [31:0] mul4_reg_487;
wire    ap_CS_fsm_state10;
wire   [31:0] grp_fu_185_p2;
reg   [31:0] angle_2_reg_492;
wire    ap_CS_fsm_state15;
wire    ap_CS_fsm_state18;
wire   [31:0] grp_fu_191_p2;
wire   [63:0] grp_fu_209_p1;
reg   [63:0] conv1_reg_507;
wire    ap_CS_fsm_state20;
wire   [63:0] grp_fu_220_p2;
reg   [63:0] mul1_reg_512;
wire    ap_CS_fsm_state27;
reg   [4:0] i_reg_144;
reg   [31:0] angle_1_reg_155;
reg   [31:0] c_y_2_reg_165;
reg   [31:0] c_x_4_reg_175;
wire   [63:0] i_cast_fu_334_p1;
wire    ap_CS_fsm_state29;
reg   [31:0] grp_fu_185_p0;
reg   [31:0] grp_fu_185_p1;
wire    ap_CS_fsm_state11;
wire    ap_CS_fsm_state14;
reg   [31:0] grp_fu_196_p0;
reg   [31:0] grp_fu_196_p1;
wire    ap_CS_fsm_state7;
reg   [31:0] grp_fu_200_p0;
reg   [31:0] grp_fu_200_p1;
wire    ap_CS_fsm_state28;
wire    ap_CS_fsm_state19;
reg   [31:0] grp_fu_213_p0;
wire    ap_CS_fsm_state21;
wire   [31:0] bitcast_ln21_fu_237_p1;
wire   [7:0] tmp_fu_240_p4;
wire   [22:0] trunc_ln21_fu_250_p1;
wire   [0:0] icmp_ln21_1_fu_260_p2;
wire   [0:0] icmp_ln21_fu_254_p2;
wire   [0:0] or_ln21_fu_266_p2;
wire   [31:0] bitcast_ln24_fu_277_p1;
wire   [31:0] xor_ln24_fu_280_p2;
wire   [31:0] xor_ln28_fu_290_p2;
wire   [0:0] and_ln21_fu_272_p2;
wire   [31:0] c_x_fu_296_p1;
wire   [31:0] c_y_fu_286_p1;
wire   [31:0] bitcast_ln35_fu_340_p1;
wire   [7:0] tmp_2_fu_344_p4;
wire   [22:0] trunc_ln35_fu_354_p1;
wire   [0:0] icmp_ln35_1_fu_364_p2;
wire   [0:0] icmp_ln35_fu_358_p2;
wire   [0:0] or_ln35_fu_370_p2;
wire   [31:0] grp_fu_206_p1;
reg   [1:0] grp_fu_185_opcode;
reg   [4:0] grp_fu_213_opcode;
reg   [28:0] ap_NS_fsm;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 29'd1;
end

cordiccart2pol_Kvalues #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
Kvalues_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(Kvalues_address0),
    .ce0(Kvalues_ce0),
    .q0(Kvalues_q0)
);

cordiccart2pol_angles #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
angles_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(angles_address0),
    .ce0(angles_ce0),
    .q0(angles_q0)
);

cordiccart2pol_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .x(x),
    .y(y),
    .r(r),
    .r_ap_vld(r_ap_vld),
    .theta(theta),
    .theta_ap_vld(theta_ap_vld)
);

cordiccart2pol_faddfsub_32ns_32ns_32_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
faddfsub_32ns_32ns_32_5_full_dsp_1_U1(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_185_p0),
    .din1(grp_fu_185_p1),
    .opcode(grp_fu_185_opcode),
    .ce(1'b1),
    .dout(grp_fu_185_p2)
);

cordiccart2pol_fadd_32ns_32ns_32_5_full_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fadd_32ns_32ns_32_5_full_dsp_1_U2(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(c_y_2_reg_165),
    .din1(reg_231),
    .ce(1'b1),
    .dout(grp_fu_191_p2)
);

cordiccart2pol_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U3(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_196_p0),
    .din1(grp_fu_196_p1),
    .ce(1'b1),
    .dout(grp_fu_196_p2)
);

cordiccart2pol_fmul_32ns_32ns_32_4_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
fmul_32ns_32ns_32_4_max_dsp_1_U4(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_200_p0),
    .din1(grp_fu_200_p1),
    .ce(1'b1),
    .dout(grp_fu_200_p2)
);

cordiccart2pol_fptrunc_64ns_32_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 64 ),
    .dout_WIDTH( 32 ))
fptrunc_64ns_32_2_no_dsp_1_U5(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(mul1_reg_512),
    .ce(1'b1),
    .dout(grp_fu_206_p1)
);

cordiccart2pol_fpext_32ns_64_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .dout_WIDTH( 64 ))
fpext_32ns_64_2_no_dsp_1_U6(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(c_x_4_reg_175),
    .ce(1'b1),
    .dout(grp_fu_209_p1)
);

cordiccart2pol_fcmp_32ns_32ns_1_2_no_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 2 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 1 ))
fcmp_32ns_32ns_1_2_no_dsp_1_U7(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_213_p0),
    .din1(32'd0),
    .ce(1'b1),
    .opcode(grp_fu_213_opcode),
    .dout(grp_fu_213_p2)
);

cordiccart2pol_dmul_64ns_64ns_64_7_max_dsp_1 #(
    .ID( 1 ),
    .NUM_STAGE( 7 ),
    .din0_WIDTH( 64 ),
    .din1_WIDTH( 64 ),
    .dout_WIDTH( 64 ))
dmul_64ns_64ns_64_7_max_dsp_1_U8(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(conv1_reg_507),
    .din1(64'd4603642589492904198),
    .ce(1'b1),
    .dout(grp_fu_220_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        angle_1_reg_155 <= angle_2_reg_492;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        angle_1_reg_155 <= angle_fu_314_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        c_x_4_reg_175 <= grp_fu_185_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        c_x_4_reg_175 <= c_x_1_fu_300_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        c_y_2_reg_165 <= grp_fu_191_p2;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        c_y_2_reg_165 <= c_y_1_fu_307_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state18)) begin
        i_reg_144 <= add_ln33_reg_441;
    end else if ((1'b1 == ap_CS_fsm_state3)) begin
        i_reg_144 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        Kvalues_load_reg_465 <= Kvalues_q0;
        and_ln35_reg_459 <= and_ln35_fu_376_p2;
        angles_load_reg_471 <= angles_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        add_ln33_reg_441 <= add_ln33_fu_322_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        angle_2_reg_492 <= grp_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state20)) begin
        conv1_reg_507 <= grp_fu_209_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state27)) begin
        mul1_reg_512 <= grp_fu_220_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        mul4_reg_487 <= grp_fu_196_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state9))) begin
        reg_225 <= grp_fu_196_p2;
        reg_231 <= grp_fu_200_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        select_ln42_reg_481[31] <= select_ln42_fu_390_p3[31];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        tmp_1_reg_421 <= grp_fu_213_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        x_read_reg_415 <= x;
        y_read_reg_408 <= y;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        Kvalues_ce0 = 1'b1;
    end else begin
        Kvalues_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        angles_ce0 = 1'b1;
    end else begin
        angles_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_fu_185_opcode = 2'd1;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_185_opcode = 2'd0;
    end else begin
        grp_fu_185_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_185_p0 = c_x_4_reg_175;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_fu_185_p0 = angle_1_reg_155;
    end else begin
        grp_fu_185_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        grp_fu_185_p1 = reg_225;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        grp_fu_185_p1 = mul4_reg_487;
    end else begin
        grp_fu_185_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_196_p0 = reg_225;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_fu_196_p0 = select_ln42_reg_481;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_196_p0 = select_ln41_fu_382_p3;
    end else begin
        grp_fu_196_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_196_p1 = c_y_2_reg_165;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        grp_fu_196_p1 = angles_load_reg_471;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_196_p1 = Kvalues_load_reg_465;
    end else begin
        grp_fu_196_p1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_200_p0 = reg_231;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_200_p0 = select_ln42_fu_390_p3;
    end else begin
        grp_fu_200_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        grp_fu_200_p1 = c_x_4_reg_175;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        grp_fu_200_p1 = Kvalues_load_reg_465;
    end else begin
        grp_fu_200_p1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln33_fu_328_p2 == 1'd0))) begin
        grp_fu_213_opcode = 5'd4;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_213_opcode = 5'd2;
    end else begin
        grp_fu_213_opcode = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        grp_fu_213_p0 = c_y_2_reg_165;
    end else if ((1'b1 == ap_CS_fsm_state1)) begin
        grp_fu_213_p0 = y;
    end else begin
        grp_fu_213_p0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state29)) begin
        r_ap_vld = 1'b1;
    end else begin
        r_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state29)) begin
        theta_ap_vld = 1'b1;
    end else begin
        theta_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state2;
        end
        ap_ST_fsm_state2 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (icmp_ln33_fu_328_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign Kvalues_address0 = i_cast_fu_334_p1;

assign add_ln33_fu_322_p2 = (i_reg_144 + 5'd1);

assign and_ln21_fu_272_p2 = (tmp_1_reg_421 & or_ln21_fu_266_p2);

assign and_ln35_fu_376_p2 = (or_ln35_fu_370_p2 & grp_fu_213_p2);

assign angle_fu_314_p3 = ((and_ln21_fu_272_p2[0:0] == 1'b1) ? 32'd1070141403 : 32'd3217625051);

assign angles_address0 = i_cast_fu_334_p1;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];

assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];

assign ap_CS_fsm_state27 = ap_CS_fsm[32'd26];

assign ap_CS_fsm_state28 = ap_CS_fsm[32'd27];

assign ap_CS_fsm_state29 = ap_CS_fsm[32'd28];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign bitcast_ln21_fu_237_p1 = y_read_reg_408;

assign bitcast_ln24_fu_277_p1 = x_read_reg_415;

assign bitcast_ln35_fu_340_p1 = c_y_2_reg_165;

assign c_x_1_fu_300_p3 = ((and_ln21_fu_272_p2[0:0] == 1'b1) ? y_read_reg_408 : c_x_fu_296_p1);

assign c_x_fu_296_p1 = xor_ln28_fu_290_p2;

assign c_y_1_fu_307_p3 = ((and_ln21_fu_272_p2[0:0] == 1'b1) ? c_y_fu_286_p1 : x_read_reg_415);

assign c_y_fu_286_p1 = xor_ln24_fu_280_p2;

assign i_cast_fu_334_p1 = i_reg_144;

assign icmp_ln21_1_fu_260_p2 = ((trunc_ln21_fu_250_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln21_fu_254_p2 = ((tmp_fu_240_p4 != 8'd255) ? 1'b1 : 1'b0);

assign icmp_ln33_fu_328_p2 = ((i_reg_144 == 5'd16) ? 1'b1 : 1'b0);

assign icmp_ln35_1_fu_364_p2 = ((trunc_ln35_fu_354_p1 == 23'd0) ? 1'b1 : 1'b0);

assign icmp_ln35_fu_358_p2 = ((tmp_2_fu_344_p4 != 8'd255) ? 1'b1 : 1'b0);

assign or_ln21_fu_266_p2 = (icmp_ln21_fu_254_p2 | icmp_ln21_1_fu_260_p2);

assign or_ln35_fu_370_p2 = (icmp_ln35_fu_358_p2 | icmp_ln35_1_fu_364_p2);

assign r = grp_fu_206_p1;

assign select_ln41_fu_382_p3 = ((and_ln35_reg_459[0:0] == 1'b1) ? 32'd3212836864 : 32'd1065353216);

assign select_ln42_fu_390_p3 = ((and_ln35_reg_459[0:0] == 1'b1) ? 32'd1065353216 : 32'd3212836864);

assign theta = angle_1_reg_155;

assign tmp_2_fu_344_p4 = {{bitcast_ln35_fu_340_p1[30:23]}};

assign tmp_fu_240_p4 = {{bitcast_ln21_fu_237_p1[30:23]}};

assign trunc_ln21_fu_250_p1 = bitcast_ln21_fu_237_p1[22:0];

assign trunc_ln35_fu_354_p1 = bitcast_ln35_fu_340_p1[22:0];

assign xor_ln24_fu_280_p2 = (bitcast_ln24_fu_277_p1 ^ 32'd2147483648);

assign xor_ln28_fu_290_p2 = (bitcast_ln21_fu_237_p1 ^ 32'd2147483648);

always @ (posedge ap_clk) begin
    select_ln42_reg_481[30:0] <= 31'b0111111100000000000000000000000;
end

endmodule //cordiccart2pol