`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:26:02 AM
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


// Code your testbench here
// or browse Examples
module simple_assretion_test;
  bit a,b,clk;
  sequence seq_a;
    a;
  endsequence
  sequence seq_b;
    b;
  endsequence
  property within_prop;
    @(posedge clk)
    seq_a |-> seq_b;
  endproperty
  assert property(within_prop)
    $display("t , Property asserted a = %b, b = %b", $time(), a,b);
    else
      $display("%t , Property failed a = %b, b = %b", $time(), a,b);
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
    end
    initial
      forever
        #5 clk =! clk;
    initial
      begin
        clk = 0;
        a = 0;
        @(posedge clk);//5
        a=1;
        @(posedge clk);//15
        b = 1;
        a = 0;
        @(posedge clk);//25
        b = 0;
        repeat(5) @(posedge clk);
        $finish();
      end
endmodule
