`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:07:53 AM
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
`include "intf.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
module mux41_top;
  mux41_if intf();
  mux41 DUT(.a(intf.a),.b(intf.b),.c(intf.c),.d(intf.d),.sel(intf.sel),.out(intf.out));
  mux41_dut_tb TB(intf);
  initial begin
    $dumpfile("mux41.vcd");
    $dumpvars(0);
  end
endmodule