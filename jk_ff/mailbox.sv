`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2024 09:50:47 AM
// Design Name: 
// Module Name: mailbox
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


module Mailbox (
    input wire clk,        // Clock signal
    input wire reset_n,    // Reset signal (active low)
    input wire write_en,   // Write enable signal
    input wire [7:0] data_in,  // Data to be written to the mailbox
    output reg [7:0] data_out, // Data read from the mailbox
    output reg empty,      // Empty flag
    output reg full        // Full flag
);

reg [7:0] mailbox_data;

always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        mailbox_data <= 8'h00;  // Initialize mailbox data
        empty <= 1'b1;          // Initialize empty flag
        full <= 1'b0;           // Initialize full flag
    end else begin
        if (write_en && !full) begin
            mailbox_data <= data_in;
            full <= 1'b1;
            empty <= 1'b0;
        end
        if (!write_en && !empty) begin
            data_out <= mailbox_data;
            full <= 1'b0;
            empty <= 1'b1;
        end
    end
end

endmodule
