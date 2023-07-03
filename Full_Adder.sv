`timescale 1 ns / 1 ps

module Full_Adder
(
    input logic A, B, cin,
    output logic sum, cout
);

logic p0, p1, p2;

assign cout = A&B | cin & (A^B);
assign sum = A ^ B ^ cin;


endmodule

