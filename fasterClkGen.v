`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 03:24:00 AM
// Design Name: 
// Module Name: fasterClkGen
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


module fasterClkGen(clk, resetSW, outsignal);
input clk;
input resetSW;
output outsignal;
reg [18:0] counter;
reg outsignal;
always @ (posedge clk)
begin
    if (resetSW)
        begin
            counter=0;
            outsignal=0;
        end
    else
        begin
            counter = counter +1;
    if (counter == 125_000) //400 Hz
        begin
            outsignal=~outsignal;
            counter =0;
        end
    end
end
endmodule
