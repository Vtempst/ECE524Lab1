`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:44:07 AM
// Design Name: 
// Module Name: upcounter
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


module upcounter(Resetn, Clock, E, Q);
input Resetn, Clock, E;
output reg Q;
always @(negedge Resetn, posedge Clock)
    if (!Resetn)
        Q <= 0;
    else if (E)
        Q <= Q + 1;
endmodule


