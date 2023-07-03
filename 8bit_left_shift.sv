`timescale 1 ns / 1ps

module leftShift(

input logic [7:0] a, //8-bit
input logic [2:0] amt,  //amount rotated
output [7:0] y //outputs all 8-bits

);

logic [7:0] res0, res1; 

assign res0 = amt[0] ? {a[6:0], a[7]} : a;
assign res1 = amt[1] ? {res0[5:0], res0[7:6]} : res0;

assign y = amt[2] ? {res1[3:0], res1[7:4]} : res1; //resultant

endmodule