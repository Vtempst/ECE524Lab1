`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 12:54:48 AM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(in0, in1, in2, in3, in4, in5, in6, in7, sel, out);
input [7:0] in0;
input [7:0] in1;
input [7:0] in2;
input [7:0] in3;
input [7:0] in4;
input [7:0] in5;
input [7:0] in6;
input [7:0] in7;
input [2:0] sel;
output reg [7:0] out;

always @(*)
    case(sel)
        3'b000: out = in0;
        3'b001: out = in1;
        3'b010: out = in2;
        3'b011: out = in3;
        3'b100: out = in4;
        3'b101: out = in5;
        3'b110: out = in6;
        3'b111: out = in7;
    endcase
endmodule
