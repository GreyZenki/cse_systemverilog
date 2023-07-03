module shifts(

input logic [7:0] A, //8-bit
input logic ir, //1-bit control signal
input logic [2:0] amt,  //amount rotated
output logic [7:0] Y

);

logic [7:0] sRight, sLeft;

rightShift rightshift_1(.a(A), .amt(amt), .y(sRight)); //Sends information to rightShift file
leftShift leftshift_1(.a(A), .amt(amt), .y(sLeft)); //Send info to leftShift to start shifting left

always_comb
    begin
    if (ir == 0)  //if the signal is 0 then it will shift right
        Y = sRight;
    else //if the signal is 1, then it will shift left
        Y = sLeft;
   end

endmodule