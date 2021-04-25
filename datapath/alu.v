/**
 * ALU - Arithmatic logical unit
 * @module_name alu
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module alu(
  input  wire [3:0]   ctl,
  input  wire [31:0]  a, b,
  output reg  [31:0]  out,
  output reg  zero // Used by BEQ. If a==b, then zero = 1'b0.
  // output wire overflow
);

  always @(a or b or ctl) begin
    case (ctl)
      4'd0: out <= a + b; // add
      4'd1: out <= a - b; // sub
      4'd2: out <= a & b; // and
      4'd3: out <= a | b; // or
      4'd4: out <= a ^ b; // xor
      4'd5: out <= {b[15:0], 16'b0}; // lui
    endcase
    zero <= a == b;
  end

endmodule