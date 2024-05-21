`timescale 1ns / 1ps

module jk_ff(
  input 	   clk	,
  input 	   reset,
  input        j	,
  input        k	,
  input        valid,
  output reg   q,
  output reg   qb
); 
  
  
  //Reset 
  always @(posedge reset) begin
    q <= 0;
    qb <= 1;
  end
   
  // Waddition operation
  always @(posedge clk) begin
    if (valid) begin
      case({j,k})
        2'b00: begin q<=q ; qb <= qb; end
        2'b01: begin q<=0; qb <= 1; end
        2'b10: begin q<=1; qb <= 0; end
        2'b11: begin q<=~q; qb <= ~qb; end
    endcase
    end
  end
endmodule
