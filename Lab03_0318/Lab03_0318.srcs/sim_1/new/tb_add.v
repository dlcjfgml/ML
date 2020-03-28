`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/03/28 14:15:37
// Design Name: 
// Module Name: tb_add
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

module tb_add();
    parameter BITWIDTH =32;
    reg [BITWIDTH-1:0] ain;
    reg [BITWIDTH-1:0] bin;     
    wire [BITWIDTH-1:0] dout;
    wire overflow;
    

    
    integer i; 
    initial begin
        for(i=0; i<32; i=i+1) begin
            ain = $urandom%(2**32-1);
            bin = $urandom%(2**32-1);
            #10;
        end
    end
    
    my_add #(BITWIDTH) MY_ADDER(
        .ain(ain),
        .bin(bin),
        .dout(dout),
        .overflow(overflow)
    );
    
    
endmodule