`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:19:00 AM
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
module Countertb;
  timeunit 1ns;
  timeprecision 1ns;
  logic Clock, Reset, Enable;
  logic [7:0] Q;
  Counter cou1 (Clock,Reset,Enable,Q);
  always begin
    #10 Clock = 1;
    #10 Clock = 0;
  end
  initial
    begin
      #3ns
      Enable = 0;
      Reset = 1;
      #10;
      Reset = 0;
      #10;
      Enable = 1;
      #23ns
      Enable = 0;
      #10;
      Enable = 1;
      #2560;
      $stop;
      $finish;
    end
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
