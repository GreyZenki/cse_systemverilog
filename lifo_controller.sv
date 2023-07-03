`timescale 1ns / 1ps
module lifo_controller #(parameter addr_width = 4)
    (
        input logic clk, reset_tmp,
        input logic pop, push,
        output logic empty, full,
        output logic stack_flag,
        output logic [addr_width-1:0] push_addr,
        output logic [addr_width-1:0] pop_addr
    );
    
    logic [addr_width-1:0] push_ptr_logic, push_ptr_next, push_ptr_succ;
    logic [addr_width-1:0] pop_ptr_logic, pop_ptr_next, pop_ptr_succ;
    logic full_logic, empty_logic, full_next, empty_next;
    logic [addr_width-1:0] max_addr =4'b0000;
    
    always_ff @(posedge clk, posedge reset_tmp)
        if(reset_tmp)
            begin 
                push_ptr_logic <= 0;
                pop_ptr_logic <= 0;
                full_logic <= 1'b0;
                empty_logic <= 1'b1;
            end
        else
            begin
                push_ptr_logic <= push_ptr_next;
                pop_ptr_logic <= pop_ptr_next;
                full_logic <= full_next;
                empty_logic <= empty_next;
            end
    always_comb
        begin
            push_ptr_succ = push_ptr_logic +1;
            pop_ptr_succ = pop_ptr_logic -1;
            
            push_ptr_next = push_ptr_logic;
            pop_ptr_next = pop_ptr_logic;
            full_next = full_logic;
            empty_next = empty_logic;
            unique case ({push,pop})
                2'b01:
                    if(~empty_logic)
                        begin
                            full_next = 1'b0;
                            pop_ptr_next = pop_ptr_succ;
                            if (pop_ptr_logic == (max_addr))
                                empty_next = 1'b1;
                        end
                2'b10:    
                    if(~full_logic)
                        begin
                            push_ptr_next = push_ptr_succ;
                            pop_ptr_next = push_ptr_logic;
                            empty_next = 1'b1;
                        end    
                2'b11:             
                        begin
                            push_ptr_next = push_ptr_succ;
                            pop_ptr_next = pop_ptr_logic;   
                        end
                        default: ;
            endcase
        end
            assign push_addr = push_ptr_logic;
            assign pop_addr = pop_ptr_logic;
            assign full = full_logic;
            assign empty = empty_logic;
                           
endmodule
