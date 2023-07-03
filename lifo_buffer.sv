`timescale 1ns / 1ps
module lifo_buffer #(parameter data_width = 8, addr_width = 4)
    (
        input logic clk, reset,
        input logic pop, push,
        input logic [data_width-1:0] w_data,
        output logic empty, full,
        output logic [data_width-1:0] r_data
    );
        logic [addr_width-1:0] push_addr, pop_addr;
        logic wr_en, full_tmp, pop_en;
        logic reset_tmp;
        logic stack_flag;
        
        assign wr_en = push & ~full_tmp;       
        assign full = full_tmp;
        assign reset_tmp = reset || stack_flag;
        
        lifo_controller #(.addr_width(addr_width)) c_unit(.*, .full(full_tmp));
        
        register_file #(.data_width(data_width), .addr_width(addr_width)) f_unit(.*);
endmodule
