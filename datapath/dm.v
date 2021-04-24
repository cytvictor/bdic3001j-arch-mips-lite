/**
 * DM - Data memory module
 * @module_name dm
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module dm (
  input wire [7:0] addr,
  input wire [31:0] data_in,
  input wire write_enable,
  input wire read_enable,
  input wire clk,
  output reg [31:0] data_out
);
  reg [31:0] data_mem[255:0]; // 4 * 256 = 1KByte data memory space

  // Write operation is async; only do write operation posedge
  always @(posedge clk) begin
    if (write_enable) begin
      data_mem[addr[7:0]][31:0] <= data_in[31:0];
    end
  end

  // Read operation is sync; only triggers when address or read flag is changed
  always @(addr or read_enable) begin
    if (read_enable) begin
      data_out[31:0] = data_mem[addr[7:0]][31:0];
    end
  end
endmodule