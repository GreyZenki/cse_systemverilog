`timescale 1ns / 1ps

module greaterthan_tb();
logic [1:0] test_a;
logic [1:0] test_b;
logic test_out;

greaterthan test (.a1(test_a[1]), .a0(test_a[0]), .b1(test_b[1]), .b0(test_b[0]), .y(test_out));
initial begin
test_a = 2'b00;
test_b = 2'b00;
#200;
test_a = 2'b00;
test_b = 2'b01;
#200;
test_a = 2'b00;
test_b = 2'b11;
#200;
test_a = 2'b10;
test_b = 2'b00;
#200;
$stop;
end
endmodule