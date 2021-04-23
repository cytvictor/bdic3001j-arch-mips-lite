/**
 * PC - Programme counter
 * @module_name pc
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module pc(
  input wire clk,
  input wire rst,
  input wire [31:0] data,
  output reg [31:0] out
);
  always @(posedge clk) begin // PC is a sequential logic
    if (rst) begin
      out[31:0] <= {32'h0000_3000};
    end else begin
      out <= data;
    end
  end
endmodule
