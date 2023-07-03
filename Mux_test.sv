`timescale 1ns / 1ps

module mux_test(
input logic clk, en,
input logic [1:0] sw,
output logic [3:0] an,
output logic [7:0] sseg
);
    
    logic [7:0] cw; 
    logic [7:0] ccw;
    logic [7:0] cw_sseg;
    logic [7:0] ccw_sseg;
    
    SevenSeg_LED  clockwise(.clk(clk),.reset(1'b0),.sseg(cw_sseg),.an(cw),.en(sw[0]));

    Mux cclockwise(.clk(clk),.reset(1'b0),.sseg(ccw_sseg),.an(ccw),.en(sw[0]));

    Direction_1 dir1(.sw(sw[1]),.cw(cw),.ccw(ccw),.an(an));

    Direction_2 dir2(.sw(sw[1]),.cwsseg(cw_sseg),.ccwsseg(ccw_sseg),.sseg(sseg));
    
endmodule