`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 02:03:08 AM
// Design Name: 
// Module Name: decoder
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


module decoder(ones, tens, ones_seg, tens_seg);
input [3:0] ones;
input [3:0] tens;
output reg [6:0] ones_seg;
output reg [6:0] tens_seg;

parameter [6:0] SEG_0 = 7'b0000001; // 0
parameter [6:0] SEG_1 = 7'b1001111; // 1
parameter [6:0] SEG_2 = 7'b0010010; // 2
parameter [6:0] SEG_3 = 7'b0000110; // 3
parameter [6:0] SEG_4 = 7'b1001100; // 4
parameter [6:0] SEG_5 = 7'b0100100; // 5
parameter [6:0] SEG_6 = 7'b0100000; // 6
parameter [6:0] SEG_7 = 7'b0001111; // 7
parameter [6:0] SEG_8 = 7'b0000000; // 8
parameter [6:0] SEG_9 = 7'b0000100; // 9

always @* begin
    case (ones)
        4'b0000: ones_seg = SEG_0;
        4'b0001: ones_seg = SEG_1;
        4'b0010: ones_seg = SEG_2;
        4'b0011: ones_seg = SEG_3;
        4'b0100: ones_seg = SEG_4;
        4'b0101: ones_seg = SEG_5;
        4'b0110: ones_seg = SEG_6;
        4'b0111: ones_seg = SEG_7;
        4'b1000: ones_seg = SEG_8;
        4'b1001: ones_seg = SEG_9;
    endcase
    case (tens)
        4'b0000: tens_seg = SEG_0;
        4'b0001: tens_seg = SEG_1;
        4'b0010: tens_seg = SEG_2;
        4'b0011: tens_seg = SEG_3;
        4'b0100: tens_seg = SEG_4;
        4'b0101: tens_seg = SEG_5;
        4'b0110: tens_seg = SEG_6;
        4'b0111: tens_seg = SEG_7;
        4'b1000: tens_seg = SEG_8;
        4'b1001: tens_seg = SEG_9;
    endcase
end
endmodule
