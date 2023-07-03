`timescale 1ns / 1ps

module dual_edge_detect(
    input logic clk, level,
    output logic tick
    );
    
typedef enum {zero, s1, one, s0} state_type;
    
state_type state_reg, state_next;
    
always_ff @(posedge clk)
    state_reg <= state_next; 
    
always_comb
begin
    state_next = state_reg;
    case(state_reg)
        zero:
            begin
                tick = 1'b0;
                if (level)
                    state_next = s1;
            end
        s1:
            begin
                tick = 1'b1;
                state_next = one;
            end
        one:
            begin
                tick = 1'b0;
                if (~level)
                    state_next = s0;
            end
        s0:
            begin
                tick = 1'b1;
                state_next = zero;
            end
        default: state_next = zero;
    endcase
end
endmodule
