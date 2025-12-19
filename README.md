# RISCV-Processor
Verilog implementation of a 32-bit RV32I single-cycle RISC-V processor. The design follows a classical single-cycle datapath where instruction fetch, decode, execute, memory access, and write-back are completed within one clock cycle as shown in the block diagram below.The processor supports R-type, I-type, load/store (S-type), and branch (B-type) instructions.

Block Diagram

Datapath Description

Program Counter (PC)
Holds the address of the current instruction. Updated using either PC + 4 or a branch target address.

Instruction Memory
Outputs a 32-bit instruction corresponding to the current PC value.

Control Unit
Generates control signals (RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, ALUControl, ImmSrc) based on opcode, funct3, and funct7.

Register File
Provides two source operands (RD1, RD2) and supports writing back results to the destination register.

Immediate Generator (Extend Unit)
Generates sign-extended immediates for I-type, S-type, and B-type instructions.

ALU
Performs arithmetic, logical, comparison, and branch condition evaluation.

Data Memory
Used for load (lw) and store (sw) instructions.

Write-Back Logic
Selects between ALU result and memory read data for register write-back.

