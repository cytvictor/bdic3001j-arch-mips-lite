/**
 * CTRL - Control module
 * @module_name ctrl
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module ctrl (
  input wire [31:0] instruction,
  output wire reg_dst, reg_write, alu_src, mem_read, mem_write, npc_jmp,
  output wire [3:0] alu_ctl
);
  wire [5:0] opcode, funct;
  assign opcode = instruction[31:26];
  assign funct = instruction[5:0];

  // Tell which instruction to be executed
  wire addu = (opcode == 6'h00) & (funct == 6'h21);
  wire subu = (opcode == 6'h00) & (funct == 6'h23);
  wire ori = opcode == 6'h0d;
  wire lw = opcode == 6'h23;
  wire sw = opcode == 6'h2b;
  wire beq = opcode == 6'h04;
  wire lui = opcode == 6'h0f;
  wire j = opcode == 6'h02;

  // generate control signals
  assign reg_dst = addu || subu; // R-type needs reg-dst
  assign alu_src = sw || lw || ori || lui || j;
  assign mem_read = lw;
  assign mem_write = sw;
  assign reg_write = addu || subu || ori || lw || lui;
  assign npc_sel = !j;
  assign alu_ctl =  lw || sw ? 4'd0 :
                    beq ? 4'd4 :
                    addu ? 4'd0 :
                    subu ? 4'd1 :
                    ori ? 4'd3:
                    4'd5; // lui

endmodule