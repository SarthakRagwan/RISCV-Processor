# RISC-V Single-Cycle Processor (RV32I) – Verilog

## Overview
This repository contains a **32-bit RV32I single-cycle RISC-V processor** implemented in **Verilog HDL**.
The processor follows a **classical single-cycle architecture**, where instruction fetch, decode, execute,
memory access, and write-back are completed within **one clock cycle**.

The design is based on a standard RISC-V datapath consisting of a Program Counter, Instruction Memory,
Register File, Control Unit, ALU, Immediate Generator, and Data Memory.

---

## Block Diagram
![Block Diagram](docs/block_diagram.png)

---

## Architecture Summary
- Single-cycle datapath
- Centralized control unit
- Separate instruction and data memory
- ALU-based execution and branch decision
- PC update using PC + 4 or branch target

---

## Supported Instruction Types
This processor supports the following **RV32I instruction formats**:

- **R-type** – Register-to-register arithmetic and logical operations
- **I-type** – Immediate arithmetic and load instructions
- **S-type** – Store instructions
- **B-type** – Branch instructions

---

## Supported Instructions

### Arithmetic & Logical
- add
- sub
- and
- or
- addi

### Load & Store
- lw
- sw

### Branch
- beq
- bne
- blt
- bgt

---

## Datapath Operation
1. **Instruction Fetch** – Instruction is fetched from instruction memory using the Program Counter (PC).
2. **Instruction Decode** – Opcode, funct3, and funct7 fields are decoded to generate control signals.
3. **Execute** – ALU performs arithmetic, logical, or comparison operations.
4. **Memory Access** – Data memory is accessed for load/store instructions.
5. **Write Back** – ALU result or memory data is written back to the register file.

---

## Directory Structure
```
riscv-single-cycle-cpu/
│
├── src/        # Verilog RTL files
├── tb/         # Testbench files
├── programs/   # Instruction memory files (.hex/.mem)
├── docs/       # Block diagram and documentation
└── README.md
```

---

## Simulation Flow
1. Load instructions into instruction memory
2. Apply clock and reset
3. Observe execution using waveform viewer

Example using Icarus Verilog:
```bash
iverilog -o cpu src/*.v tb/tb_riscv.v
vvp cpu
gtkwave dump.vcd
```

---

## Tools Used
- Verilog HDL
- Icarus Verilog
- GTKWave

---

## Future Enhancements
- Pipelined implementation
- Hazard detection and forwarding
- Support for additional RV32I instructions
- Performance optimization

---

### Author
Designed and implemented as a learning project to demonstrate **RISC-V processor architecture and Verilog-based CPU design**.
