# Extending Power ISA in Microwatt with Lightweight INT8 and FP8 Scalar Operations

## Introduction
Modern AI/ML workloads increasingly rely on low-precision arithmetic to achieve high performance with reduced power and area. Two widely used formats are **FP8** (e.g., E4M3, E5M2) and **INT8**.  
- **FP8** helps in training or mixed-precision inference.  
- **INT8** is suited for quantized inference on edge devices.  

**Microwatt** is an open-source implementation of a POWER ISA 3.0 core. To enable efficient AI tasks on lightweight hardware, this project extends the Microwatt core with **native scalar operations** for FP8 and INT8. These extensions will be integrated into Microwatt’s decode/execution pipeline, enabling **low-power and low-area edge AI use cases** without needing wide vectors or GPUs.

---

## Problem Statement
Design and implement **scalar-only extensions** to Power ISA in the Microwatt core, supporting INT8 and FP8 arithmetic operations (ADD, SUB, MUL, MAC, and INT8 dot-products/accumulations).  
The project will provide RTL testbenches and target the **SKY130 open-source process**, licensed under open hardware standards and reproducible via the **OpenFrame user area**.

---

## Objectives
- Implement scalar **FP8 operations**: ADD, SUB, MUL, MAC.  
- Implement scalar **INT8 operations**: ADD, SUB, MUL, MAC, DOT (dot-product).  
- Integrate these into **Microwatt’s decode and execute pipeline RTL**.  
- Provide full verification using **Verilog/VHDL testbenches** and simulation.  
- Implement synthesis targeting **SKY130 cells**.  
- Release under an **open-source license (MIT)**.  

---

## Tools & Technologies

**Simulation / RTL Tools**  
- Verilator (RTL simulation)  
- VHDL/Verilog testbenches  
- GHDL (optional)  
- GTKWave (waveform viewer)  

**Synthesis / FPGA / Physical Implementation**  
- Yosys + OpenLane (synthesis & layout)  
- SKY130 standard cell libraries  
- NextPNR (optional FPGA prototyping)  
- OpenFrame user project infrastructure  

**Software / Development**  
- GCC for POWER ISA (toolchain)  
- Git / GitHub (version control, collaboration)  
- Documentation in Markdown / GitHub Pages  

---

## Block Diagram

<p align="center">
  <img src="block_diagram.png" alt="Microwatt Block Diagram" width="500"/>
</p>

---

## Expected Outcomes
- Extended Microwatt core with **native INT8 and FP8 scalar support**.  
- Open-source RTL, testbenches, and documentation.  
- Synthesis results on **SKY130 technology**.  
- Reusable building block for lightweight AI/ML accelerators.  

---

## License
This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.
