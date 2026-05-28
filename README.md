TALLY: Totalizing Automated Logic Ledger for Yield
An FPGA-based Electronic Voting Machine (EVM) designed for the Philippine electoral context using Verilog and Xilinx Vivado.

The TALLY Logic
T — Trigger:** Precise button-press detection.
A — Accumulate:** Secure vote incrementing in 8-bit registers.
L — Latch:** Stable hardware memory storage.
L — Logic:** Advanced debouncing to prevent multi-vote errors.
Y — Yield:** Real-time visual output via 7-segment multiplexing.

## Project Specifications
- Hardware Target: Artix-7 FPGA
- Language: Verilog HDL
- Simulation Proof: 8-bit overflow testing successful (rolls over at 256th vote).
