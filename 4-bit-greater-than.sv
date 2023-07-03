`timescale 1ns / 1ps

module fourgreaterthan(
input logic [3:0] a,b,
output logic y 
);
logic e0, e1, e2, e3;

greaterthan gt1(.a(a[1:0]), .b(b[1:0]), .y(e0));
greaterthan gt2(.a(a[3:0]), .b(b[3:2]), .y(e1));
eq2 equal1(.a(a[3:2]),.b(b[3:2]), .aeqb(e2));

assign y = e1 ||( e0 & e2);

endmodule
