// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_control (
    clk,
    reset,
    TRAN_s_axi_control_AWADDR,
    TRAN_s_axi_control_AWVALID,
    TRAN_s_axi_control_AWREADY,
    TRAN_s_axi_control_WVALID,
    TRAN_s_axi_control_WREADY,
    TRAN_s_axi_control_WDATA,
    TRAN_s_axi_control_WSTRB,
    TRAN_s_axi_control_ARADDR,
    TRAN_s_axi_control_ARVALID,
    TRAN_s_axi_control_ARREADY,
    TRAN_s_axi_control_RVALID,
    TRAN_s_axi_control_RREADY,
    TRAN_s_axi_control_RDATA,
    TRAN_s_axi_control_RRESP,
    TRAN_s_axi_control_BVALID,
    TRAN_s_axi_control_BREADY,
    TRAN_s_axi_control_BRESP,
    TRAN_control_write_data_finish,
    TRAN_control_read_data_finish,
    TRAN_control_start_in,
    TRAN_control_idle_in,
    TRAN_control_ready_in,
    TRAN_control_done_in,
    TRAN_control_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_x "../tv/cdatafile/c.cordiccart2pol.autotvin_x.dat"
`define TV_IN_y "../tv/cdatafile/c.cordiccart2pol.autotvin_y.dat"
`define TV_OUT_r "../tv/rtldatafile/rtl.cordiccart2pol.autotvout_r.dat"
`define TV_OUT_theta "../tv/rtldatafile/rtl.cordiccart2pol.autotvout_theta.dat"
parameter ADDR_WIDTH = 6;
parameter DATA_WIDTH = 32;
parameter x_DEPTH = 1;
reg [31 : 0] x_OPERATE_DEPTH = 0;
parameter x_c_bitwidth = 32;
parameter y_DEPTH = 1;
reg [31 : 0] y_OPERATE_DEPTH = 0;
parameter y_c_bitwidth = 32;
parameter r_DEPTH = 1;
reg [31 : 0] r_OPERATE_DEPTH = 0;
parameter r_c_bitwidth = 32;
parameter theta_DEPTH = 1;
reg [31 : 0] theta_OPERATE_DEPTH = 0;
parameter theta_c_bitwidth = 32;
parameter x_data_in_addr = 16;
parameter y_data_in_addr = 24;
parameter r_data_out_addr = 32;
parameter r_valid_out_addr = 36;
parameter theta_data_out_addr = 48;
parameter theta_valid_out_addr = 52;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_AWADDR;
output  TRAN_s_axi_control_AWVALID;
input  TRAN_s_axi_control_AWREADY;
output  TRAN_s_axi_control_WVALID;
input  TRAN_s_axi_control_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_control_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_control_ARADDR;
output  TRAN_s_axi_control_ARVALID;
input  TRAN_s_axi_control_ARREADY;
input  TRAN_s_axi_control_RVALID;
output  TRAN_s_axi_control_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_control_RDATA;
input [2 - 1 : 0] TRAN_s_axi_control_RRESP;
input  TRAN_s_axi_control_BVALID;
output  TRAN_s_axi_control_BREADY;
input [2 - 1 : 0] TRAN_s_axi_control_BRESP;
output TRAN_control_write_data_finish;
output TRAN_control_read_data_finish;
input     clk;
input     reset;
input     TRAN_control_start_in;
input     TRAN_control_done_in;
input     TRAN_control_ready_in;
input     TRAN_control_idle_in;
input     TRAN_control_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] mem_x [x_DEPTH - 1 : 0];
reg x_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_y [y_DEPTH - 1 : 0];
reg y_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_r [r_DEPTH - 1 : 0];
reg r_read_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_theta [theta_DEPTH - 1 : 0];
reg theta_read_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
//write x reg
reg [31 : 0] write_x_count = 0;
reg write_x_run_flag = 0;
reg write_one_x_data_done = 0;
//write y reg
reg [31 : 0] write_y_count = 0;
reg write_y_run_flag = 0;
reg write_one_y_data_done = 0;
//read r reg
reg [31 : 0] read_r_count = 0;
reg read_r_run_flag = 0;
reg read_one_r_data_done = 0;
//read theta reg
reg [31 : 0] read_theta_count = 0;
reg read_theta_run_flag = 0;
reg read_one_theta_data_done = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_control_AWADDR = AWADDR_reg;
assign TRAN_s_axi_control_AWVALID = AWVALID_reg;
assign TRAN_s_axi_control_WVALID = WVALID_reg;
assign TRAN_s_axi_control_WDATA = WDATA_reg;
assign TRAN_s_axi_control_WSTRB = WSTRB_reg;
assign TRAN_s_axi_control_ARADDR = ARADDR_reg;
assign TRAN_s_axi_control_ARVALID = ARVALID_reg;
assign TRAN_s_axi_control_RREADY = RREADY_reg;
assign TRAN_s_axi_control_BREADY = BREADY_reg;
assign TRAN_control_read_data_finish = 1 & r_read_data_finish & theta_read_data_finish;
assign TRAN_control_write_data_finish = 1 & x_write_data_finish & y_write_data_finish;
always @(TRAN_control_done_in) 
begin
    AESL_done_index_reg <= TRAN_control_done_in;
end
always @(TRAN_control_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_control_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 32; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth <= 1024 & bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_control_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_control_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_control_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_control_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_control_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_control_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_control_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_control_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        x_write_data_finish <= 0;
        write_x_run_flag <= 0; 
        write_x_count = 0;
        count_operate_depth_by_bitwidth_and_depth (x_c_bitwidth, x_DEPTH, x_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            x_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_x_run_flag <= 1; 
            write_x_count = 0;
        end
        if (write_one_x_data_done === 1) begin
            write_x_count = write_x_count + 1;
            if (write_x_count == x_OPERATE_DEPTH) begin
                write_x_run_flag <= 0; 
                x_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_x
    integer write_x_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] x_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = x_c_bitwidth;
    process_num = 0;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_0_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_x_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write x data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (x_c_bitwidth < 32) begin
                        x_data_tmp_reg = mem_x[write_x_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < x_c_bitwidth) begin
                                x_data_tmp_reg[j] = mem_x[write_x_count][i*32 + j];
                            end
                            else begin
                                x_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (x_data_in_addr + write_x_count * four_byte_num * 4 + i * 4, x_data_tmp_reg, write_x_resp);
                end
                process_busy = 0;
                write_one_x_data_done <= 1;
                @(posedge clk);
                write_one_x_data_done <= 0;
            end   
            process_0_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        y_write_data_finish <= 0;
        write_y_run_flag <= 0; 
        write_y_count = 0;
        count_operate_depth_by_bitwidth_and_depth (y_c_bitwidth, y_DEPTH, y_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            y_write_data_finish <= 0;
        end
        if (AESL_ready_reg === 1) begin
            write_y_run_flag <= 1; 
            write_y_count = 0;
        end
        if (write_one_y_data_done === 1) begin
            write_y_count = write_y_count + 1;
            if (write_y_count == y_OPERATE_DEPTH) begin
                write_y_run_flag <= 0; 
                y_write_data_finish <= 1;
            end
        end
    end
end

initial begin : write_y
    integer write_y_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    reg [31 : 0] y_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = y_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_1_finish <= 0;

        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            get_ack = 1;
            if (write_y_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write y data 
                for (i = 0 ; i < four_byte_num ; i = i+1) begin
                    if (y_c_bitwidth < 32) begin
                        y_data_tmp_reg = mem_y[write_y_count];
                    end
                    else begin
                        for (j=0 ; j<32 ; j = j + 1) begin
                            if (i*32 + j < y_c_bitwidth) begin
                                y_data_tmp_reg[j] = mem_y[write_y_count][i*32 + j];
                            end
                            else begin
                                y_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    write (y_data_in_addr + write_y_count * four_byte_num * 4 + i * 4, y_data_tmp_reg, write_y_resp);
                end
                process_busy = 0;
                write_one_y_data_done <= 1;
                @(posedge clk);
                write_one_y_data_done <= 0;
            end   
            process_1_finish <= 1;
        end
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        r_read_data_finish <= 0;
        read_r_run_flag <= 0; 
        read_r_count = 0;
        count_operate_depth_by_bitwidth_and_depth (r_c_bitwidth, r_DEPTH, r_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            read_r_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            r_read_data_finish <= 0;
            read_r_count = 0; 
        end
        if (read_one_r_data_done === 1) begin
            read_r_count = read_r_count + 1;
            if (read_r_count == r_OPERATE_DEPTH) begin
                read_r_run_flag <= 0; 
                r_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_r
    integer read_r_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = r_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_2_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_r_run_flag === 1) begin
                process_busy = 1;
                get_vld = 0;
                //read r vld
                read (r_valid_out_addr, RDATA_reg, read_r_resp);
                if (RDATA_reg[0 : 0] == 1) begin
                    get_vld = 1;
                end
                if (get_vld == 1) begin
                    //read r data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (r_data_out_addr + read_r_count * four_byte_num * 4 + i * 4, RDATA_reg, read_r_resp);
                        if (r_c_bitwidth < 32) begin
                            mem_r[read_r_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < r_c_bitwidth) begin
                                    mem_r[read_r_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_r_data_done <= 1;
                    @(posedge clk);
                    read_one_r_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_2_finish <= 1;
        end
        @(posedge clk);
    end    
end
always @(reset or posedge clk) begin
    if (reset == 0) begin
        theta_read_data_finish <= 0;
        read_theta_run_flag <= 0; 
        read_theta_count = 0;
        count_operate_depth_by_bitwidth_and_depth (theta_c_bitwidth, theta_DEPTH, theta_OPERATE_DEPTH);
    end
    else begin
        if (TRAN_control_start_in === 1) begin
            read_theta_run_flag = 1; 
        end
        if (TRAN_control_transaction_done_in === 1) begin
            theta_read_data_finish <= 0;
            read_theta_count = 0; 
        end
        if (read_one_theta_data_done === 1) begin
            read_theta_count = read_theta_count + 1;
            if (read_theta_count == theta_OPERATE_DEPTH) begin
                read_theta_run_flag <= 0; 
                theta_read_data_finish <= 1;
            end
        end
    end
end

initial begin : read_theta
    integer read_theta_resp;
    integer process_num;
    integer get_vld;
    integer four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;

    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = theta_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num) ;
    while (1) begin
        process_3_finish <= 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (read_theta_run_flag === 1) begin
                process_busy = 1;
                get_vld = 0;
                //read theta vld
                read (theta_valid_out_addr, RDATA_reg, read_theta_resp);
                if (RDATA_reg[0 : 0] == 1) begin
                    get_vld = 1;
                end
                if (get_vld == 1) begin
                    //read theta data 
                    for (i = 0 ; i < four_byte_num ; i = i+1) begin
                        read (theta_data_out_addr + read_theta_count * four_byte_num * 4 + i * 4, RDATA_reg, read_theta_resp);
                        if (theta_c_bitwidth < 32) begin
                            mem_theta[read_theta_count] <= RDATA_reg;
                        end
                        else begin
                            for (j=0 ; j < 32 ; j = j + 1) begin
                                if (i*32 + j < theta_c_bitwidth) begin
                                    mem_theta[read_theta_count][i*32 + j] <= RDATA_reg[j];
                                end
                            end
                        end
                    end
                    
                    read_one_theta_data_done <= 1;
                    @(posedge clk);
                    read_one_theta_data_done <= 0;
                end    
                process_busy = 0;
            end    
            process_3_finish <= 1;
        end
        @(posedge clk);
    end    
end
//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [127 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_x_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [x_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (x_c_bitwidth , factor);
  fp = $fopen(`TV_IN_x ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_x); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < x_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_x [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_x [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_x [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_x [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_x [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_y_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [y_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] mem_tmp; 
  reg [ 8*5 : 1] str;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (y_c_bitwidth , factor);
  fp = $fopen(`TV_IN_y ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_y); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < y_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  mem_tmp [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  mem_tmp [31 : 24] = token_tmp;
                  mem_y [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  mem_tmp [31 : 16] = token_tmp;
                  mem_y [i/factor] = mem_tmp;
                  mem_tmp [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_y [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_y [i/factor] = mem_tmp;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_y [i/factor] = mem_tmp;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_r_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [r_c_bitwidth - 1 : 0] mem_tmp; 
  reg [ 100*8 : 1] str;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (r_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (r_read_data_finish !== 1 || TRAN_control_transaction_done_in === 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_r, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_r); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (r_DEPTH - r_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_r[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_r[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  mem_tmp = mem_r[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  mem_tmp = mem_r[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_r[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_r[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_r[i]);
          end
      end 
      if (factor == 4) begin
          if ((r_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][23:16]);
          end
          if ((r_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][15:8]);
          end
          if ((r_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((r_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_r[r_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
      while (TRAN_control_start_in !== 1) begin
          @(posedge clk);
      end
  end 
end 
 
//------------------------Write file----------------------- 
 
// Write data to file 
 
initial begin : write_theta_file_proc 
  integer fp; 
  integer factor; 
  integer transaction_idx; 
  reg [theta_c_bitwidth - 1 : 0] mem_tmp; 
  reg [ 100*8 : 1] str;
  integer i; 
  transaction_idx = 0; 
  count_seperate_factor_by_bitwidth (theta_c_bitwidth , factor);
  while(1) begin 
      @(posedge clk);
      while (theta_read_data_finish !== 1 || TRAN_control_transaction_done_in === 1) begin
          @(posedge clk);
      end
      # 0.1;
      fp = $fopen(`TV_OUT_theta, "a"); 
      if(fp == 0) begin       // Failed to open file 
          $display("Failed to open file \"%s\"!", `TV_OUT_theta); 
          $finish; 
      end 
      $fdisplay(fp, "[[transaction]] %d", transaction_idx);
      for (i = 0; i < (theta_DEPTH - theta_DEPTH % factor); i = i + 1) begin
          if (factor == 4) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_theta[i/factor][7:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_theta[i/factor][15:8];
              end
              if (i%factor == 2) begin
                  mem_tmp = mem_theta[i/factor][23:16];
              end
              if (i%factor == 3) begin
                  mem_tmp = mem_theta[i/factor][31:24];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  mem_tmp = mem_theta[i/factor][15:0];
              end
              if (i%factor == 1) begin
                  mem_tmp = mem_theta[i/factor][31:16];
              end
              $fdisplay(fp,"0x%x",mem_tmp);
          end
          if (factor == 1) begin
              $fdisplay(fp,"0x%x",mem_theta[i]);
          end
      end 
      if (factor == 4) begin
          if ((theta_DEPTH - 1) % factor == 2) begin
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][15:8]);
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][23:16]);
          end
          if ((theta_DEPTH - 1) % factor == 1) begin
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][7:0]);
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][15:8]);
          end
          if ((theta_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][7:0]);
          end
      end
      if (factor == 2) begin
          if ((theta_DEPTH - 1) % factor == 0) begin
              $fdisplay(fp,"0x%x",mem_theta[theta_DEPTH / factor][15:0]);
          end
      end
      $fdisplay(fp, "[[/transaction]]");
      transaction_idx = transaction_idx + 1;
      $fclose(fp); 
      while (TRAN_control_start_in !== 1) begin
          @(posedge clk);
      end
  end 
end 
 
endmodule
