/**
 * MUX - Multiplexer
 * @module_name mux2
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module mux2 #(parameter width = 32) (
  input wire [width-1:0] a,
  input wire [width-1:0] b,
  input wire sel,
  output wire [width-1:0] out
);
  assign out = sel ? b : a;
endmodule
