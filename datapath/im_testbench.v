`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2021 09:26:34 PM
// Design Name: 
// Module Name: im_testbench
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


module im_testbench(
    output wire [31:0] instruction
    );
    reg [7:0] address;
    im mem(address, instruction);
    initial begin
        address = 8'h00;
        #20 address = 8'h01;
        #20 address = 8'h02;
    end
endmodule
