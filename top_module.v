`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2026 12:33:37 AM
// Design Name: 
// Module Name: top_module
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


module top_module(Resetn, Clock, E, sel, out1, data_out, AN);
input Resetn;
input Clock;
input E;
input [2:0] sel;
output [7:0] out1;
output [6:0] data_out;
output reg [7:0] AN;

wire slowClock;
wire fastClock;

wire [7:0] binary_out;
wire [7:0] even_out;
wire [7:0] odd_out;
wire [7:0] gray_out;
wire [7:0] johnson_out;
wire [7:0] ring_out;
wire [7:0] fibonacci_out;

wire [3:0] bcd_ones;
wire [3:0] bcd_tens;
wire [7:0] bcd_out;

wire [3:0] separated_ones;
wire [3:0] separated_tens;

wire [6:0]patterntomultiplexer1;
wire [6:0]patterntomultiplexer2;
wire select;

reg [3:0] display_ones;
reg [3:0] display_tens;

reg display_enable;
wire [7:0] mux_AN;

slowerClkGen slowClkgen_insta(
    .resetSW(1'b0),
    .clk(Clock),
    .outsignal(slowClock)
);

fasterClkGen fasterClkGen_insta(
    .resetSW(1'b0),
    .clk(Clock),
    .outsignal(fastClock)
);

upcounter upcounter_insta(
    .Resetn(1'b1),
    .Clock(fastClock),
    .E(1'b1),
    .Q(select)
);

bcd_counter bcd_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .ones(bcd_ones),
    .tens(bcd_tens)
);

binary_counter binary_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(binary_out)
);

even_counter even_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(even_out)
);

fibonacci_counter fibonacci_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(fibonacci_out)
);

gray_counter gray_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(gray_out)
);

johnson_counter johnson_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(johnson_out)
);

odd_counter odd_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(odd_out)
);

ring_counter ring_counter_insta(
    .Resetn(Resetn),
    .Clock(slowClock),
    .E(E),
    .out1(ring_out)
);

mux8to1 mux8to1_insta(
    .in0(even_out),
    .in1(odd_out),
    .in2(bcd_out),
    .in3(binary_out),
    .in4(gray_out),
    .in5(johnson_out),
    .in6(ring_out),
    .in7(fibonacci_out),
    .sel(sel),
    .out(out1)
);

digitseparator digitseparator_insta(
    .out1(out1),
    .ones(separated_ones),
    .tens(separated_tens)
);

decoder decoder_insta(
    .ones(display_ones),
    .tens(display_tens),
    .ones_seg(patterntomultiplexer1),
    .tens_seg(patterntomultiplexer2)
);

multiplexer multiplexer_insta(
    .in1(patterntomultiplexer1),
    .in2(patterntomultiplexer2),
    .S(select),
    .out1(data_out),
    .AN(mux_AN)
);

assign bcd_out[7:4] = bcd_tens;
assign bcd_out[3:0] = bcd_ones;

always @(*)
begin
    if (sel == 3'b010)
    begin
       display_ones = bcd_ones;
       display_tens = bcd_tens;
    end
    else
    begin
        display_ones = separated_ones;
        display_tens = separated_tens;
    end
end    

always @(*)
begin
    if (sel == 3'b101)
        display_enable = 1'b0;
    else if (sel == 3'b110)
        display_enable = 1'b0;
    else
        display_enable = 1'b1;
end

always @(*)
begin
    if (display_enable)
        AN = mux_AN;
    else
        AN = 8'b11111111;
end
endmodule
