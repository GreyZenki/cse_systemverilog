`timescale 1ns / 1ps

module fourgreater_tb();
logic [3:0] test_a;
logic [3:0] test_b;
logic test_out;

fourgreaterthan test ( .a(test_a[3:0]), .b(test_b[3:0]), .y(test_out)); 
initial begin 
test_a = 4'b0110;
test_b = 4'b0000;
#200;
test_a = 4'b0010;
test_b = 4'b1000;
#200;
test_a = 4'b0100;
test_b = 4'b1101;
#200;
test_a = 4'b1000;
test_b = 4'b0001;
#200;
$stop;
end 
endmodule
