`timescale 1ns / 1ps

module edge_detector_tb();
    logic clk, level, dtick, etick, reset;

always begin
    clk = 1'b0;
    #1 clk = 1'b1;
    #1;
end

initial begin
    reset = 1'b1;
    #1 reset = 1'b0;
end

edge_detect_moore ed (.clk(clk), .level(level), .tick(etick), .reset(reset));
dual_edge_detect ded (.clk(clk), .level(level), .tick(dtick));

initial begin
    level = 1'b0;
    #5
    level = 1'b1;
    #10
    level = 1'b0;
    #10
    level = 1'b1;
    #5
    $stop;
end

endmodule