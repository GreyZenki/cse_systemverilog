`timescale 1ns / 1ps

module edge_detect_moore(
    input logic clk, level, reset,
    output logic tick
    );
    
logic level_reg;

always_ff @ (posedge clk, posedge reset)
    if (reset)
        level_reg <= 0;
    else
        level_reg <= level;

assign tick = level_reg;
    
endmodule