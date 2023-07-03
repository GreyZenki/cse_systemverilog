`timescale 1 ns / 1 ps

module shift_tb;

logic [15:0] test_a; //16-bit (right shift)
logic [15:0] test_b; //16-bit (left shift)
logic ir;
logic [3:0] amt; //changes amount to every 3 bits

shifts uut(.A(test_a),.ir(ir), .amt(amt), .Y(test_b)); //receives parameters of shifts

initial begin
//tests when ir is either 0 or 1
test_a = 16'b1000_1000;
ir = 1'b0;
amt = 3'b001;

#200; //waits 200 nanoseconds

test_a = 16'b1000_1000;
ir = 1'b1;
#200;

test_a = 16'b1111_0000;
ir = 1'b1;
#200;

test_a = 16'b1111_0000;
ir = 1'b0;
#200;

test_a = 16'b0000_1111;
ir = 1'b1;
#200;

test_a = 16'b0000_1111;
ir = 1'b0;
#200;

test_a = 16'b1010_1010;
ir = 1'b1;
#200;

test_a = 16'b1010_1010;
ir = 1'b0;
#200;
end
endmodule