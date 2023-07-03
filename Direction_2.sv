`timescale 1ns / 1ps

module Direction_2(
input logic [7:0] cwsseg,
input logic [7:0] ccwsseg,
input logic sw,
output logic [7:0] sseg
);
    assign sseg = (sw)? cwsseg: ccwsseg;
    
endmodule