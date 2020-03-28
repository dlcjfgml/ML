`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/28 14:41:09
// Design Name: 
// Module Name: my_fusedmult
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

module my_fusedmult #(
        parameter BITWIDTH = 32
)
(
        input [BITWIDTH-1:0] ain, 
        input [BITWIDTH-1:0] bin,
        input en, 
        input clk,     
        output [2*BITWIDTH-1:0] dout
        
);

//wire [BITWIDTH-1:0] out1, out2;
wire [2*BITWIDTH-1:0] out;
reg [2*BITWIDTH-1:0] finalout=0;
wire [2*BITWIDTH-1:0] mulout;
wire tmp, temp;

my_mul #(32) mult(.ain(ain), .bin(bin), .dout(mulout));
my_add #(64) adder (.ain(dout), .bin(mulout), .dout(out), .overflow(tmp));

//my_add #(32) adder1 (.ain(dout[31:0]), .bin(mulout[31:0]), .dout(out1), .overflow(tmp));
//my_add #(32) adder2 (.ain(dout[63:32] + tmp), .bin(mulout[63:32]), .dout(out2), .overflow(temp));
assign dout = finalout;

always @(posedge clk) begin
    if (en ==1'b0 ) begin
        finalout = 0;
    end
    else begin
        finalout = out;
//        finalout[31:0] = out1;
//        finalout[63:32] = out2;
    end
end


endmodule
