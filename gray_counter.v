`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 11:34:28 PM
// Design Name: 
// Module Name: gray_counter
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

module gray_counter(Resetn, Clock, E, out1);
input Resetn, Clock, E;
output reg [7:0] out1;
reg [7:0] binary;
always @(negedge Resetn, posedge Clock)
    if (!Resetn)
    begin
        out1 <= 8'b00000000;
        binary <= 8'b00000000;
    end
    else if (E)
    begin
        binary <= binary + 1;
        out1 <= (binary + 1) ^ ((binary + 1) >> 1);
    end
endmodule
