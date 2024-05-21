// Code your design here
`timescale 1ns/1ps
module mux41(sel,a,b,c,d,out);
  input [1:0] sel;
  input a,b,c,d;
  output reg out;
  always@(sel or a or b or c or d) begin
    case(sel)
      2'b00: out<=a;
      2'b01: out<=b;
      2'b10: out<=c;
      2'b11: out<=d;
    endcase
  end
endmodule