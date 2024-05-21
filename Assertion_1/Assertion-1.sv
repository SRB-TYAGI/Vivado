`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:17:40 AM
// Design Name: 
// Module Name: Assertion-1
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


// Code your design here
module Counter (input logic Clock, Reset, Enable, output logic [7:0] Q);
timeunit 1ns;
timeprecision 1ns;
always_ff @(posedge Clock or posedge Reset)
if (Reset)
Q <= 0;
else
if (Enable)
Q <= Q + 1;
aReset : assert property (@(posedge Clock) Reset |-> Q == 0);
  aEnable : assert property (@(posedge Clock) disable iff (Reset) !Enable |=> Q == $past(Q)) ;
    aCount : assert property (@(posedge Clock) disable iff (Reset) Enable |=> Q == $past(Q)+8'b1);
endmodule