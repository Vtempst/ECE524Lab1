`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 01:54:52 AM
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(in1, in2, out1, S, AN);

input [6:0]in1;
input [6:0]in2;

input S;
output reg [6:0]out1;
output reg [7:0]AN;

always @*
if (S == 0)
    begin
        out1 = in1;
        AN = 8'b11111110;
    end
else if (S == 1)
    begin
        out1 = in2;
        AN = 8'b11111101;
    end
endmodule
