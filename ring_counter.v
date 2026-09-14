`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 11:37:35 PM
// Design Name: 
// Module Name: odd_counter
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


module ring_counter(Resetn, Clock, E, out1);
input Resetn, Clock, E;
output reg [7:0] out1;

always @(negedge Resetn, posedge Clock)
    if (!Resetn)
    begin
        out1 <= 8'b10000000;
    end
    else if (E)
    begin
        if(out1 == 8'b00000001)
            out1 <= 8'b10000000;
        else
            out1 <= out1 >> 1;
    end
endmodule
