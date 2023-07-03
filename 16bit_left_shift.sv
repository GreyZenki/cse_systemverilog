`timescale 1 ns / 1ps

module leftShift(

input logic [15:0] a, //16-bit
input logic [3:0] amt,  //amount rotated
output [15:0] y //outputs all 16-bits

);

logic [15:0] res0, res1,res2; 

assign res0 = amt[0] ? {a[14:0], a[15]} : a;
assign res1 = amt[1] ? {res0[13:0], res0[15:14]} : res0;
assign res2 = amt[2] ? {res1[12:0], res1[15:12]} : res1;

assign y = amt[3] ? {res2[7:0], res2[15:8]} : res2; //resultant

endmodule