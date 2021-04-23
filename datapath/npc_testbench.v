`timescale 1ns / 1ps

module npc_testbench ();
  wire [31:0] next_addr;
  wire [31:0] addr;
  reg clk, reset;

  pc pc(clk, reset, next_addr, addr);
  npc npc(addr, next_addr);

  initial begin
    clk = 1;
    reset = 1;

    #100 reset = 0;
  end

  always #100 clk = ~clk;

endmodule