# MIPS-Processor-Lite
*Work In Progress*

Module: BDIC3001J Computer Architectures

Implemented: addu, subu, ori, lui, lw, sw, beq, j

## Address space
RAM: 0x0000_0000 ~ 0x0000_0FFF

ROM: 0x0000_3000 ~ 0x0000_3FFF

## Directory structure
```
mips-processor
  |- control
      |- ctrl.v ()
  |- datapath
      |- alu.v  (ALU)
      |- ext.v  (Sign extension)
      |- dm.v   (Data memory)
      |- im.v   (Instruction memory)
      |- mux.v  (Multiplexer)
      |- pc.v   (Program counter, triggered posedge)
  |- mips.v (The single-staged processor)
  |- test_cpu.v (The testbench module)
  |- code.asm (Assembly code of the program)
  |- code.txt (MARS dumped hexadecimal program text, converted from dump.txt)
```

## Design Detail
The PC increment will be triggered **posedege**.

### /
#### mips.v
Main CPU program.

#### mips_testbench.v
Entry point of tb.

### /datapath
#### alu.v

#### dm.v

#### mux.v
Module name: mux
Description: Multiplexer for [width]
- Inputs: `a`, `b` [width-1:0], `sel` The selector
- Outputs: `out` [width-1:0] the selected number

#### ext.v
Module name: ext
Description: Zero extension and sign extension to 32 bits
- Inputs: 

#### im.v
Module name: im
Description: Instruction memory of 1KB size
- Inputs: `addr` [7:0] The specified address
- Outputs: `out` [31:0] The instruction at the given memory address

#### dm.v
Module name: dm
Description: Data memory of 1KB size

#### pc.v
Module name: pc
Description: Program counter
- Inputs: ``

#### npc.v
Module name: npc
Description: Next Program Counter calculator

#### gpr.v
Module name: gpr
Description: Grouped Registers

#### mux.v
Module name: mux
Description: Multiplexer of parameterized width

### /control
#### ctrl.v
Module name: ctrl
Description: CPU signal controls
