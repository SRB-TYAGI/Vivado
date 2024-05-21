`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 10:45:23 AM
// Design Name: 
// Module Name: semaphore
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
module tb;
  semaphore key = new(1);
  initial begin
    repeat(2) begin
      fork
        // Process A
        begin
          $display("[A] process A is trying to get key %0t", $time);
          key.get(1);
          $display("[A] process A got the key %0t", $time);
          #10;
          key.put();
          $display("[A] process A is returning the key %0t", $time);
        end
        // Process B
        begin
          $display("[B] process B is trying to get key %0t", $time);
          key.get(1);
          $display("[B] process B got the key %0t", $time);
          #10;
          key.put(1);
          $display("[B] process B is returning the key %0t", $time);
        end
      join
    end
  end
endmodule