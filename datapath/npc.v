/**
 * NPC - Next PC calculation module
 * @module_name npc
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module npc (
  input wire [31:0] pc,
  output wire [31:0] npc
);
  assign npc = pc + 4;
endmodule