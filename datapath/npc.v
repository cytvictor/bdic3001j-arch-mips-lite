/**
 * NPC - Next PC calculation module
 * @module_name npc
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module npc (
  input wire [31:0] pc,
  input wire jmp_imm,
  input wire [31:0] imm_addr_offset,
  output wire [31:0] npc
);
  wire [31:0] extended_offset_32;
  ext #(16) ext_2(1, {imm_addr_offset[13:0], 2'b0}, extended_offset_32);
  // If beq true, then jump to offset + pc; otherwise jump to next instruction
  assign npc = pc + (jmp_imm ? extended_offset_32 + 4 : 4);
endmodule