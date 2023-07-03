`timescale 1ns / 1ps

module Direction_1(
input logic [7:0] cw,
input logic [7:0] ccw,
input logic sw,
output logic [7:0] an
);
    
    assign an = (sw)? cw: ccw;
endmodule