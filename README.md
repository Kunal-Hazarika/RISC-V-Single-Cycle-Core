# RISC-V Single Cycle Core

This repository contains the Verilog implementation of a **32-bit RISC-V single-cycle processor**.  
The design follows the RV32I base instruction set architecture and includes separate modules for the ALU, instruction memory, data memory, control unit, register file, and more.

## Features
- **Single-Cycle Execution**: Each instruction completes in one clock cycle.
- **32-bit ALU** supporting arithmetic, logical, and shift operations.
- **Instruction Memory** and **Data Memory** modules for program storage and execution.
- **Control Unit** with main and ALU decoders.
- **Register File** supporting dual-read and single-write operations.
- **Sign Extension** for immediate values.
- **Program Counter (PC)** management with PC Adder.
- **Multiplexer (Mux)** for instruction/data flow control.
- **Fully modular design** for easy testing and debugging.

## File Structure
| File Name                | Description |
|--------------------------|-------------|
| `ALU.v`                  | Arithmetic Logic Unit for performing operations. |
| `ALU_Decoder.v`          | Decodes ALU control signals. |
| `Control_Unit_Top.v`     | Top-level control unit integrating decoders. |
| `Data_Memory.v`          | Data memory for load/store instructions. |
| `Instruction_Memory.v`   | Stores the program instructions. |
| `Main_Decoder.v`         | Generates control signals for instruction execution. |
| `Mux.v`                  | Multiplexer for data path selection. |
| `PC.v`                   | Holds the current program counter value. |
| `PC_Adder.v`             | Increments the program counter. |
| `Register_File.v`        | 32 registers with read/write functionality. |
| `Sign_Extend.v`          | Extends immediate values to 32 bits. |
| `Single_Cycle_Top.v`     | Top-level processor module integrating all components. |
| `Single_Cycle_Top_Tb.v`  | Testbench for verifying the design. |
| `memfile.hex`            | Memory initialisation file for instructions/data. |
| `riscv_single_cycle_core.png` | Block diagram of the processor. |

## Block Diagram
![RISC-V Single Cycle Core Block Diagram](riscv_single_cycle_core.png)
