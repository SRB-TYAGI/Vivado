`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 09:48:19 AM
// Design Name: 
// Module Name: transaction
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



class transaction;
  
  //declaring the transaction items
  rand bit  j;
  rand bit  k;
       bit  q;
       bit  qb;
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- j = %0d, k = %0d",j,k);
    $display("- q = %0d, qb = %0d",q,qb);
    $display("-------------------------");
  endfunction
endclass
