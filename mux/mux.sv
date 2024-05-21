module mux(
  input 	   clk	,
  input 	   reset,
  input   a	,
  input   b	,
  input   c ,
  input   d ,
  input        valid,
  input [1:0] sel,
  output reg out 
); 
  
  
  //Reset 
  always @(posedge reset) 
    out <= 0;
   
  // mux operation
  always @(posedge clk) begin
    if (valid) begin
      case(sel)
       2'b00:out <= a;
       2'b01:out <= b;
       2'b10:out <= c;
       2'b11:out <= d;
      endcase
    end
  end
endmodule