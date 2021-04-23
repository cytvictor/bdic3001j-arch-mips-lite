/**
 * ALU - Arithmatic logical unit
 * @module_name alu
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module alu(
  input       [3:0]   ctl,
  input       [31:0]  a, b,
  output reg  [31:0]  out,
  output wire overflow
);

  always @(*) begin
    case (ctl)
      4'd0: out <= add_ab; // add
      4'd1: out <= sub_ab; // sub
      4'd2: out <= a & b;  // and
      4'd3: out <= a | b;  // or
      // 4'd4: out ;
    endcase
  end

endmodule