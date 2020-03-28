`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/27 18:00:01
// Design Name: 
// Module Name: my_add
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


module my_add #(
        parameter BITWIDTH = 32
)
(
        input [BITWIDTH-1:0] ain,
        input [BITWIDTH-1:0] bin,     
        output [BITWIDTH-1:0] dout,
        output overflow
);
       
       assign {overflow ,dout} = ain+bin;
       
//       integer i;
//       reg [BITWIDTH-1:0] val;
//       reg [BITWIDTH:0] carry = 0; 
//       always @(*) begin
//            carry = 0;
//            for(i=0; i<BITWIDTH; i=i+1) begin
//                val[i] = ain[i] ^ bin[i] ^ carry[i];
//                carry[i+1] =  ((ain[i]^bin[i]) & carry[i]) | (ain[i]&bin[i]);
//            end
//       end
       
//       assign dout = val;
//       assign overflow =  carry[BITWIDTH];        
               
endmodule
