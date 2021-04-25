module gpr_testbench ();
  reg clk, rst;
  reg SIG_RF_W;
  reg [4:0] reg_read1, reg_read2, reg_write;
  reg [31:0] data_write;
  wire [31:0] reg_data1, reg_data2;

  gpr gpr_(clk, rst, SIG_RF_W, reg_read1, reg_read2, reg_write, data_write, reg_data1, reg_data2);

  initial begin
    clk = 1;
    rst = 1;
    reg_read1 = 0;
    reg_read2 = 0;
    #100 begin
      rst = 0;
      SIG_RF_W = 1;
      reg_write = 5'b00001;
      data_write = 32'h0000_0233;
    end
    #100 begin
      SIG_RF_W = 1;
      reg_write = 5'b00000;
      data_write = 32'h0000_0233;
    end
    #100 begin
      SIG_RF_W = 0;
      reg_read1 = 5'b00001;
      reg_read2 = 5'b00000;
    end
  end

  always #50 clk = ~clk;

endmodule

