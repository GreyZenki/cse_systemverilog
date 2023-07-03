`timescale 1ns / 1ps


module lifo_tb
#(parameter data_width = 8, addr_width = 4)
    (

    );
    localparam T = 20;

    logic clk, reset;
    logic pop, push;
    logic [data_width-1:0] w_data;
    logic empty, full;
    logic [data_width-1:0] r_data;

    lifo_buffer #(.addr_width(addr_width)) lifo_test (.*);
    always
        begin
            clk = 1'b1;
            #(T/2);
            clk = 1'b0;
            #(T/2);
        end

    initial
        begin
            reset = 1'b1;
            #(T/2);
            reset = 1'b0;
        end

    initial
        begin
            w_data = 8'b1011_0001;
    
            push = 1'b1; pop = 1'b0;
            @(negedge clk);
            w_data = 8'b0001_1011;
            @(negedge clk);
            w_data = 8'b0101_1011;
            @(negedge clk);
            w_data = 8'b0011_1011;
            @(negedge clk);
            w_data = 8'b0101_1011;
            @(negedge clk);
            w_data = 8'b0000_1011;
            @(negedge clk);
            w_data = 8'b1010_1011;
            @(negedge clk);
            w_data = 8'b0001_1011;
            @(negedge clk);
            w_data = 8'b0101_1011;
            @(negedge clk);
            w_data = 8'b0011_1011;
            @(negedge clk);
            w_data = 8'b0101_1011;
            @(negedge clk);
            w_data = 8'b0000_1011;
            @(negedge clk);
            w_data = 8'b1010_1011;
            @(negedge clk);
            w_data = 8'b0011_1011;
            @(negedge clk);
            w_data = 8'b0101_1011;
            @(negedge clk);
            w_data = 8'b0101_1001;
            @(negedge clk);
            w_data = 8'b0001_1011;
            @(negedge clk);
            push = 1'b0; pop = 1'b1;
            #300;
    
            #100;
            $stop;
        end
endmodule
