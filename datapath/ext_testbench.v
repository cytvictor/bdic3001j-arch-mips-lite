`timescale 1ns / 1ps

module ext_testbench(
    output wire [31:0] dout
);

reg[5:0] din;
reg s;
ext #(.width(4)) ext1(.ext_signed(s), .in(din), .out(dout));

initial begin
    din = 4'b0000;
    s = 1;
    #10 din = 4'b1010;
    s = 0;
    #10 din = 4'b1110;
    s = 1;
    #10 din = 4'b0010;
    s = 0;
end
endmodule
