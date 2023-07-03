`timescale 1 ns / 1 ps
module FullAdder_tb();
    logic A, B, cin, sum, cout;
    Full_Adder dut (A, B, cin, cout, sum);
    
    integer i;
    initial begin
    
        for (i=0; i<2**3; i++) 
            begin
                {A,B, cin} = i; #100;
        end
     end

endmodule
