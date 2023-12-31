`timescale 1ns / 1ps
module fifo
       #(
        parameter DATA_WIDTH = 8, 
              ADDR_WIDTH = 4
        )
        (
         input logic clk, reset,
         input logic rd, wr,
         input logic [DATA_WIDTH-1:0] w_data,
         output logic empty, full,
         output logic [DATA_WIDTH-1:0] r_data
        );
        logic [ADDR_WIDTH-1:0] w_addr, r_addr;
        logic wr_en, full_temp;
        
        assign wr_en = wr & ~full_temp;  
        assign full = full_temp;
        
        fifo_ctrl #(.ADDR_WIDTH(ADDR_WIDTH)) c_unit(.*, .full(full_temp));
        
        reg_file #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) f_unit(.*);
endmodule

