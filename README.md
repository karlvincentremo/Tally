# TALLY: Totalizing Automated Logic Ledger for Yield

### FPGA-Based Electronic Voting Machine

TALLY is a Verilog-based electronic voting machine prototype designed for an FPGA. It demonstrates how two independent vote inputs can be debounced, counted, and connected to a multiplexed seven-segment display.

The project is intended for learning and demonstrating digital logic design with Verilog HDL and Xilinx Vivado. It is an educational prototype, not a certified or production-ready election system.

## Features

- **Two independent vote inputs** — Each push button controls a separate 8-bit vote counter.
- **Push-button debouncing** — Filters out short mechanical button fluctuations before a vote is registered.
- **One count per press** — Rising-edge detection prevents a held button from continuously increasing the tally.
- **Synchronous reset** — Clears both vote counters and their previous-input states.
- **8-bit vote counters** — Each counter stores values from 0 to 255 and wraps back to 0 after overflow.
- **Seven-segment display interface** — Alternates between two display anodes to multiplex the two counter outputs.

## How It Works

The design is organized into four main stages:

1. **Input:** The voter presses one of the two push buttons.
2. **Debouncing:** The corresponding debouncer waits for the input to remain high long enough to produce a clean signal.
3. **Counting:** The counter detects the clean signal's rising edge and increments the matching vote total once.
4. **Display:** The display driver alternates between the two output channels.

```text
Button 1 ──> Debouncer 1 ──┐
                           ├──> Vote Counters ──> Display Driver ──> 7-Segment Display
Button 2 ──> Debouncer 2 ──┘
                                  ▲
                                Reset
```

## Hardware and Tools

| Item | Specification |
|---|---|
| FPGA family | Xilinx Artix-7 |
| Target device | XC7A35T-CPG236-1 |
| HDL | Verilog |
| Design and simulation tool | Xilinx Vivado 2025.1 |
| Simulator | Vivado Simulator (XSim) |

The Vivado project is configured for the device listed above. A specific FPGA development-board model and its pin assignments are not included in the repository.

## Project Files

| File | Description |
|---|---|
| `TALLY_EVM.xpr` | Xilinx Vivado project file |
| `top.v` | Top-level module connecting the debouncers, counters, and display driver |
| `debouncer.v` | Conditions the raw push-button inputs |
| `counter.v` | Maintains the two 8-bit vote totals and detects input rising edges |
| `display.v` | Generates the multiplexed seven-segment outputs |
| `tb_tally.v` | Simulation testbench for the voting logic |

## Getting Started

### Requirements

- Xilinx Vivado with Artix-7 device support
- Vivado Simulator (XSim), included with Vivado

The project file was created with Vivado 2025.1. Other versions may require project migration.

### 1. Clone the Repository

```bash
git clone https://github.com/karlvincentremo/Tally.git
cd Tally
```

### 2. Open the Vivado Project

1. Launch Xilinx Vivado.
2. Select **Open Project**.
3. Navigate to the cloned repository.
4. Open `TALLY_EVM.xpr`.

### 3. Run the Behavioral Simulation

1. In the **Flow Navigator**, open **Simulation**.
2. Select **Run Behavioral Simulation**.
3. The project is configured to use `tb_tally` as its simulation top.
4. Inspect `tally1` and `tally2` in the waveform window to observe the counter values.

## Testbench

The included testbench generates a 100 MHz clock and applies 260 simulated presses to the first vote input. The second input remains inactive during this test.

Because each vote counter is 8 bits wide, the expected final values are:

| Signal | Expected value |
|---|---:|
| `tally1` | 4 (`8'h04`) |
| `tally2` | 0 (`8'h00`) |

The first counter returns to zero after reaching 255, then records the remaining four presses. The current testbench provides stimulus for waveform inspection; it does not yet contain automated assertions that report pass or fail.

## Design Notes and Current Limitations

- **Display decoding:** The current display module sends the lower seven bits of each counter directly to the active-low segment outputs. It does not yet convert the full vote count into decimal or BCD digits.
- **FPGA pin constraints:** No XDC constraints file is included. Before programming a physical board, add the correct pin assignments, I/O standards, and clock constraints for the specific development board.
- **Test coverage:** The provided stress test exercises the first vote input. Additional tests for the second input, reset behavior, and simultaneous input presses would improve verification.
- **Project scope:** TALLY is a digital logic demonstration. It does not implement the security, auditability, reliability, or certification requirements of a real election system.

## Future Improvements

- Add binary-to-decimal or BCD conversion for readable vote totals on the seven-segment display.
- Expand the testbench with checks for both vote inputs, reset behavior, and counter overflow.
- Add board-specific XDC constraints and validate the design on the intended FPGA development board.
- Explore reliable vote storage and audit mechanisms as future design work.

---

**TALLY** — A Verilog-based FPGA voting-machine prototype.
