`timescale 1 ns / 1 ps

module rightShift(

input logic [15:0] a, //16-bit
input logic [3:0] amt,  //amount rotated
output [15:0] y //outputs all 16-bits

);

logic [15:0] res0, res1, res2; 

assign res0 = amt[0] ? {a[0], a[15:2]} : a;
assign res1 = amt[1] ? {res0[1:0], res0[15:2]} : res0;
assign res2 = amt[2] ? {res1[7:0], res1[15:12]} : res1;
assign y = amt[3] ? {res2[8:0], res2[15:7]} : res2; //resultant

endmodule