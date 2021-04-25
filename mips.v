/**
 * MIPS - Single-cycle CPU main module.
 * Supported instructions: addu, subu, ori, lui
 * @module_name mips
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module mips (
  // input wire clk, rst
);
  reg clk, rst;

  // TODO: move clk generator to mips_testbench after completed
  initial begin
    clk = 1;
    rst = 1;

    #100 rst = 0;
  end

  always #50 clk = ~clk;

  // ALU
  wire [3:0] ALU_CTL;
  wire [31:0] ALU_IN_A, ALU_IN_B, ALU_OUT;
  wire ALU_ZERO_OUT;
  alu alu_(ALU_CTL, ALU_IN_A, ALU_IN_B, ALU_OUT, ALU_ZERO_OUT);

  // PC and NPC
  wire [31:0] PC_ADDR, PC_NEXT_ADDR;
  pc pc_(clk, rst, PC_NEXT_ADDR, PC_ADDR);
  npc npc_(PC_ADDR, PC_NEXT_ADDR);

  // shift PC from 0000_3000 to 0000_0000 for `im`
  wire [31:0] PC_ADDR_FOR_IM = PC_ADDR - 32'h0000_3000;
  wire [7:0]  IM_ADDR = PC_ADDR_FOR_IM / 4;
  wire [31:0] IM_DATA;
  wire [4:0] IM_DATA_RS = IM_DATA[25:21];
  wire [4:0] IM_DATA_RT = IM_DATA[20:16];
  wire [4:0] IM_DATA_RD = IM_DATA[15:11];
  wire [15:0] IM_DATA_IMM16 = IM_DATA[15:0];
  im im_(IM_ADDR, IM_DATA);

  // CTRL
  wire CTRL_REG_DST, CTRL_REG_WRITE, CTRL_ALU_SRC, CTRL_MEM_TO_REG, CTRL_MEM_READ, CTRL_MEM_WRITE, CTRL_NPC_JMP;
  ctrl ctrl_(IM_DATA, CTRL_REG_DST, CTRL_REG_WRITE, CTRL_ALU_SRC, CTRL_MEM_TO_REG, CTRL_MEM_READ, CTRL_MEM_WRITE, CTRL_NPC_JMP, ALU_CTL);

  // GPR
  wire [31:0] GPR_RD2;
  wire [4:0] GPR_ADDR_WRITE_IN1;
  wire [4:0] GPR_ADDR_READ_IN1 = IM_DATA_RS;
  wire [4:0] GPR_ADDR_READ_IN2 = IM_DATA_RT;
  gpr gpr_(clk, rst, CTRL_REG_WRITE, GPR_ADDR_READ_IN1, GPR_ADDR_READ_IN2, GPR_ADDR_WRITE_IN1, ALU_OUT, ALU_IN_A, GPR_RD2);

  // Multiplex GPR Inputs (Those reg addrs to read and to write differs by instruction)
  mux2 mux2_2(IM_DATA_RT, IM_DATA_RD, CTRL_REG_DST, GPR_ADDR_WRITE_IN1);
  // mux2 mux2_3(0'b00000, IM_DATA_RT, CTRL_REG_DST, GPR_ADDR_READ_IN2);

  // Multiplex ALU input b (either rd or extended immediate number)
  wire [31:0] EXTENDED_ALU_IN_B;
  mux2 mux2_1(GPR_RD2, EXTENDED_ALU_IN_B, CTRL_ALU_SRC, ALU_IN_B); // if ALU_SRC true, then use extended immediate as ALU input B
  ext #(16) ext_1(0, IM_DATA[15:0], EXTENDED_ALU_IN_B); // Extend immediate number to 32 bits
endmodule