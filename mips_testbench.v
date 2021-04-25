/**
 * MIPS_TESTBENCH - testbench entry for MIPS
 * @module_name mips_testbench
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module mips_testbench ();
  wire clk, rst;

  // Setup the clock and trigger reset once

  initial begin
    clk = 1;
    rst = 1;
    reg_read1 = 0;
    reg_read2 = 0;
    #100 begin
      rst = 0;
    end
  end

  always #50 clk = ~clk;

  // then CPU
endmodule