/**
 * MUX - Multiplexer
 * @module_name mux
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module mux #(parameter width = 32) (
  input wire [width-1:0] a,
  input wire [width-1:0] b,
  input wire sel,
  output wire [width-1:0] out
);
  assign out = sel ? b : a;
endmodule
