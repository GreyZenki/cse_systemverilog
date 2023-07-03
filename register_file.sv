`timescale 1ns / 1ps

module register_file #(parameter 
    data_width = 8,
    addr_width =2)
    (
     input logic clk,
     input logic wr_en,
     input logic [addr_width-1:0] push_addr, pop_addr,
     input logic [data_width-1:0] w_data,
     output logic [data_width-1:0] r_data
    );
    
    logic [data_width-1:0] array_reg
    [0:2**addr_width-1];
    
        always_ff @(posedge clk)
            if(wr_en)
                array_reg[push_addr]<= w_data;
            assign r_data = array_reg[pop_addr];
endmodule
