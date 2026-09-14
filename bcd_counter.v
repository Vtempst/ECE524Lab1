`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 11:32:02 PM
// Design Name: 
// Module Name: bcd_counter
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

module bcd_counter(Resetn, Clock, E, ones, tens);
input Resetn, Clock, E;
output reg [3:0] ones;
output reg [3:0] tens;
always @(negedge Resetn, posedge Clock)
   if (!Resetn)
   begin
         ones <= 0;
         tens <= 0;
   end
   else if (E)
   begin
         ones <= ones + 1;
         if(ones == 9)
            begin
            ones <= 0;
            tens <= tens + 1;
            end
         else if(tens == 9)
            tens <= 0;
         end
endmodule
