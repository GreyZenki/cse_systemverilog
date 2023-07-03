module debounce
(
    input logic clk, reset,
    input logic sw,
    output logic db_level, db_tick
);
   localparam N=22;
    
    typedef enum{zero, wait0, one, wait1} state_type;
                 
   state_type state_reg, state_next;
    
   logic [N-1:0] q_reg, q_next;
   logic q_zero;
   logic q_load, q_dec;

  always_ff @(posedge clk, posedge reset)
  if (reset)
  begin
  state_reg <= zero;
  q_reg <= 0;
  end
  else
   begin
   state_reg <= state_next;
   q_reg <= q_next;
   end

   assign q_next = (q_load) ? {N{1'b1}}:
   (q_dec) ? q_reg-1 : q_reg;

   assign q_zero = (q_next==0);
  
   always_comb
   begin
   state_next = state_reg;   
   q_load = 1'b0;
   q_dec = 1'b0;
   db_tick = 1'b0;        
   db_level = 1'b0;
   case (state_reg)
   zero:
   begin 
   if (sw)
   begin
   state_next = wait1;
   q_load = 1'b1;
   end
   end
   wait1:
   begin
   if (sw)
   begin
   q_dec = 1'b1;
   if (q_zero)
   begin
   state_next = one;
   db_tick = 1'b1;
   end
   end
   else 
   state_next = zero;
   end
   one:
   begin
   db_level = 1'b1;
   if (~sw)
   begin
   state_next = wait0;
   q_load = 1'b1; 
   end
   end
   wait0:
   begin
   db_level = 1'b1;
   if (~sw)
   begin
   q_dec = 1'b1;
   if (q_zero)
   state_next = zero;
   end
   else 
   state_next = one;

   end
   default: state_next = zero;
   endcase
   end

endmodule