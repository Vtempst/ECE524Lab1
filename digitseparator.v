`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 02:05:20 AM
// Design Name: 
// Module Name: digitseparator
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


module digitseparator(ones, tens, out1);
input [7:0] out1;
output [3:0] ones;
output [3:0] tens;

assign tens = (out1 / 10) % 10;
assign ones = out1 % 10;
endmodule
