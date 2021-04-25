/**
 * NPC - Next PC calculation module
 * @module_name npc
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */
module npc (
  input wire [31:0] pc,
  input wire [1:0] jmp_type,
  input wire [31:0] imm_addr_offset,
  input wire alu_zero_out,
  output wire [31:0] npc
);
  // exteneded offset for beq
  wire [31:0] beq_extended_offset_32;
  ext #(16) ext_2(1, {imm_addr_offset[13:0], 2'b0}, beq_extended_offset_32);

  // extended addr for j
  wire [28:0] j_shifted_addr = {imm_addr_offset[25:0], 2'b0};

  // If beq true, then jump to offset + pc; otherwise jump to next instruction
  assign npc =  jmp_type == 2'b01 ? (alu_zero_out ? pc + beq_extended_offset_32 + 4 : pc + 4) : // beq
                jmp_type == 2'b00 ? pc + 4 : // normal
                {pc[31:28], j_shifted_addr}; // j (jmp_type == 2'b10)
endmodule