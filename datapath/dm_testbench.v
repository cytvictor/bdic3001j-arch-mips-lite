module dm_testbench ();
  reg [7:0] addr;
  reg [31:0] din;
  wire [31:0] dout;
  reg write, read, clk;
  dm dm1(addr, din, write, read, clk, dout);

  initial begin
    clk = 1;
    forever begin
      #50 clk = ~clk;
    end
  end

  initial begin
    addr = 8'h00;
    din = 32'haaff;
    write = 1;
    #100 begin
      addr = 8'h01;
      din = 32'hffaa;
      write = 1;
    end
    #100 begin
      addr = 8'h02;
      din = 32'h2333;
      write = 1;
    end
    #100 begin
      addr = 8'h01;
      write = 0;
      read = 1;
    end
  end
endmodule