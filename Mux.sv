`timescale 1ns / 1ps

module Mux(
input logic clk, reset, 
input logic en,
output logic [3:0] an,
output logic [7:0] sseg
);

    //local parameter
    localparam N = 28;
    
    //internal signal declaration
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    //register
    always_ff @(posedge clk, posedge reset)
        if (reset)
                q_reg <= 0;
            else
                if (en)
            q_reg <= q_next;
   
    //next-state logic
    assign q_next = q_reg + 1;
   
   //hex to seven-segment led display 
    always_comb
    case (q_reg[N-1:N-3])
        3'b000:
            begin
                an =  4'b1110;
                sseg[7:0] = 8'b10011100;
            end
    
        3'b001:
            begin
                an =  4'b1101;
                sseg[7:0] = 8'b10011100;
            end
    
        3'b010:
            begin
                an =  4'b1011;
                sseg[7:0] = 8'b10011100;
            end
    
        3'b011:
            begin
                an =  4'b0111;
                sseg[7:0] = 8'b10011100;
            end
    
        3'b100:
            begin
                an =  4'b0111;
                sseg[7:0] = 8'b10100011;
            end
    
        3'b101:
            begin
                an =  4'b1011;
                sseg[7:0] = 8'b10100011;
            end
    
        3'b110:
            begin
                an =  4'b1101;
                sseg[7:0] = 8'b10100011;
            end
    
        default:
            begin
                an =  4'b1110;
                sseg[7:0] = 8'b10100011;
            end
    
    endcase
endmodule    