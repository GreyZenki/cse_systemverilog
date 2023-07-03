`timescale 1ns / 1ps

module greaterthan(
input logic [1:0] a,b,
output logic y
    );
logic and1, and2, and3;
assign and1 = a[1] & ~b[1];
assign and2 = a[0] & ~b[1] & ~b[0];
assign and3 = a[1] & a[0] & b[1];
assign y = and1 || and2 || and3;
endmodule