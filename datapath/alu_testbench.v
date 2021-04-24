module alu_testbench ();
  reg   [31:0] a, b;
  reg   [3:0]  ctl;
  wire  [31:0] out;
  wire zero;

  alu ALU(ctl, a, b, out, zero);

  initial begin
    a = 32'h0000_0001;
    b = 32'h0000_0100;
    ctl = 4'h0;
    #100 ctl = 4'h1;
    #100 ctl = 4'h2;
    #100 ctl = 4'h3;
    #100 ctl = 4'h4;
    #100 a = 32'h0000_0100;
  end
endmodule
