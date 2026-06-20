# # Parameterized Synchronous FIFO in SystemVerilog

## Overview
This project implements a parameterized synchronous FIFO (First-In First-Out) buffer using SystemVerilog. The design supports configurable data width and FIFO depth, along with full and empty status flags.

The FIFO was developed and simulated using Xilinx Vivado as part of my learning journey in Digital VLSI Design and Functional Verification.

---

## Features
Features:
- Single-clock synchronous FIFO architecture
- Parameterized FIFO depth and data width
- Full and Empty flag generation
- Circular buffer implementation
- Basic read and write functionality

---

## Design Parameters

| Parameter | Description | Default Value |
|------------|------------|------------|
| WIDTH | Data width | 8 bits |
| DEPTH | FIFO depth | 8 entries |

---

## Files

```
fifo.sv      // FIFO RTL
fifo_tb.sv   // Testbench with assertions
fifo_simulation.png   // Simulation waveform
RTL_schematic.png
README.md
```

---

## FIFO Architecture
The FIFO uses:
- Memory array for data storage
- Write pointer (`wr_ptr`)
- Read pointer (`rd_ptr`)
- Entry counter (`count`)
- Full and Empty status logic

### Full Condition

```systemverilog
full = (count == DEPTH);
```

### Empty Condition

```systemverilog
empty = (count == 0);
```

---

## Verification
The FIFO functionality was verified using a SystemVerilog testbench.

### Test Sequence
1. Apply reset
2. Write:
   - 0xAA
   - 0xBB
   - 0xCC
3. Read data back
4. Verify FIFO ordering
5. Verify Empty flag assertion

### Expected Output

Write Order:

```
AA → BB → CC
```

Read Order:

```
AA → BB → CC
```

This confirms correct FIFO behavior.

---

## Simulation Tool
- Xilinx Vivado
- SystemVerilog

---

## Future Improvements
Planned enhancements:
- Support simultaneous read and write operations
- Add SystemVerilog assertions (SVA)
- Develop a self-checking testbench
- Add constrained-random verification
- Implement an asynchronous FIFO version

---

## Learning Outcomes
Through this project, I gained practical experience with:
- RTL Design using SystemVerilog
- Sequential logic design
- Circular buffer implementation
- FIFO architecture
- Vivado simulation and debugging
- Testbench development
- Waveform analysis and verification

---

## Author
Ananya Satish
Electronics and Communication Engineering (ECE)
Interested in Digital VLSI Design, Functional Verification, and RTL Design.
