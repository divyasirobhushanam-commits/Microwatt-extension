# Extending Power ISA in Microwatt with Lightweight INT8 and FP8 Scalar Operations

## Introduction
Modern AI/ML workloads increasingly rely on low-precision arithmetic to achieve high performance with reduced power and area. Two widely used formats are **FP8** (e.g., E4M3, E5M2) and **INT8**.  
- **FP8** helps in training or mixed-precision inference.  
- **INT8** is suited for quantized inference on edge devices.  

**Microwatt** is an open-source implementation of a POWER ISA 3.0 core. To enable efficient AI tasks on lightweight hardware, this project extends the Microwatt core with **native scalar operations** for FP8 and INT8. These extensions will be integrated into Microwatt’s decode/execution pipeline, enabling **low-power and low-area edge AI use cases** without needing wide vectors or GPUs.

---

## Problem Statement
Current lightweight CPUs (like Microwatt) do not support low-precision FP8/INT8 arithmetic natively, limiting their usefulness in AI/ML workloads.  

The goal of this project is to:  
- Design and implement **scalar-only extensions** to the Power ISA in Microwatt.  
- Support INT8 and FP8 arithmetic operations (ADD, SUB, MUL, MAC, DOT).  
- Provide testbenches and synthesis results targeting the **SKY130 open-source process**.  
- Release as **open hardware**, reproducible under the OpenFrame user area.

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

## Impact & Applications
By adding FP8 and INT8 support to Microwatt, this project enables:  
- **Edge AI/ML devices** (IoT sensors, drones, smart cameras) to run inference locally without needing GPUs.  
- **Healthcare and wearables** to process AI workloads in real time with ultra-low power.  
- **Open-source silicon projects** to adopt low-precision AI instructions, accelerating research and teaching.  
- A **reproducible reference design** for universities and startups exploring TinyML hardware.  

This bridges the gap between **general-purpose CPUs** and **specialized AI accelerators**, making AI more accessible on open hardware.

---

## Expected Outcomes
- Extended Microwatt core with **native INT8 and FP8 scalar support**.  
- RTL + testbenches for reproducible verification.  
- Synthesis results on **SKY130 technology**.  
- Open-source release, serving as a **building block for future AI accelerators**.  

---

## Project Plan (Timeline)
- **Phase 1 (Week 1–2):** Add INT8 arithmetic unit (ADD, SUB, MUL, MAC, DOT) with testbenches.  
- **Phase 2 (Week 3–4):** Add FP8 unit (ADD, SUB, MUL, MAC) and integrate into Microwatt pipeline.  
- **Phase 3 (Week 5+):** Verify with simulations, synthesize on SKY130 using OpenLane, and document results.  

---

## License
This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.
