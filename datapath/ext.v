/**
 * EXT - Zero extension and sign extension. Extend the input data to [width] bits.
 * @module_name ext
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
/*
Examples:
ext #(.width(4)) ext_1(.ext_signed(1), .in(input_data[3:0]), .out(out_data))
*/
module ext #(
  parameter width = 16
) (
  input wire ext_signed, // signed
  input wire [width-1:0] in,
  output wire [31:0] out
);
  // Replicate '0' (unsigned) or MSB (signed) of in for (32-width) times, and concat with in.
  assign out = {{32 - width{ext_signed ? in[width-1] : 1'b0}}, in};
endmodule