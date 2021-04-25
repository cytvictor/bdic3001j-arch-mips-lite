/**
 * GPR - RegFile / Grouping Registers
 * @module_name gpr
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module gpr (
  input wire clk, rst,
  input wire write_enable,
  input wire [4:0] addr_read_in1, addr_read_in2, addr_write_in, // 5 bits in MIPS instruction
  input wire [31:0] data_write,
  output wire [31:0] data_read_out1, data_read_out2
);
  integer n;
  reg [31:0] reg_file[31:0];

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (n = 0; n < 32; n = n + 1) begin
        reg_file[n] <= 32'b0;
      end
    end else begin
      if (write_enable) begin
        reg_file[addr_write_in][31:0] <= data_write;
      end
    end
  end

  assign data_read_out1 = reg_file[addr_read_in1];
  assign data_read_out2 = reg_file[addr_read_in2];
endmodule