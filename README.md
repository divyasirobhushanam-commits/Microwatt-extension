Project Synopsis
Title:

Extending Power ISA in Microwatt with Lightweight INT8 and FP8 Scalar Operations


Introduction:

Modern AI/ML workloads increasingly rely on low-precision arithmetic to achieve high performance with reduced power and area. Two widely used formats are FP8 (e.g. E4M3, E5M2) and INT8. FP8 helps in training or mixed-precision inference, while INT8 is suited for quantized inference on edge devices.

Microwatt is an open-source implementation of a POWER ISA 3.0 core. To enable efficient AI tasks on lightweight hardware, this project proposes extending the Microwatt core with native scalar operations for FP8 and INT8. These extensions will be integrated into Microwatt’s decode/execution pipeline, enabling low-power/low-area edge AI use cases without needing wide vectors or GPU.


Problem Statement:

Design and implement scalar-only extensions to Power ISA in the Microwatt core, supporting INT8 and FP8 arithmetic operations (add, sub, mul, MAC), with RTL testbenches, targeting SKY130 process, open licensed, and suitable for reproducible flow under the OpenFrame user area.


Objectives:

Implement scalar FP8 operations (ADD, SUB, MUL, MAC).

Implement scalar INT8 operations (ADD, SUB, MUL, MAC).

Integrate these into Microwatt’s decode and execute pipeline RTL.

Provide full verification via testbenches and simulation (e.g. using Verilog/VHDL + test vectors).

Implement synthesis targeting SKY130 cells.

Use an open-source license.


Tools & Technologies:

Simulation / RTL Tools:

Verilator (for RTL simulation)

VHDL/Verilog testbenches

GHDL (optional)

GTKWave (waveform viewer)

Synthesis / FPGA / Physical Implementation Tools:

Yosys + OpenLane (for synthesis / layout)

SKY130 standard cell libraries

NextPNR (if FPGA prototyping needed)

OpenFrame user project infrastructure

Software / Dev Tools:

GCC for POWER ISA (toolchain)

Git / GitHub (for version control, public repo)

Documentation tools (Markdown / ReadTheDocs / Github Pages)


