`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2026 11:37:35 PM
// Design Name: 
// Module Name: fibonacci_counter
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


module fibonacci_counter(Resetn, Clock, E, out1);

input Resetn, Clock, E;
output [7:0] out1;

reg [31:0] num1, num2;

always @(negedge Resetn, posedge Clock)
begin
    if (!Resetn)
    begin
        num1 <= 0;
        num2 <= 1;
    end
    else if (E)
    begin
        if (num2 < 100)
        begin
            num1 <= num2;
            num2 <= num1 + num2;
        end
        else
        begin
            num1 <= 0;
            num2 <= 1;
        end
    end
end

assign out1 = num1;

endmodule
