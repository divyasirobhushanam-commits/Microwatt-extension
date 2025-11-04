# Microwatt Extension — Custom Scalar Unit for OpenPOWER

## 🚀 Overview

This project extends the **Microwatt OpenPOWER CPU core** with a **Custom Scalar Unit (CSU)** that accelerates mixed-precision INT8 and FP8 arithmetic operations.  
It is developed as part of the **ChipFoundry Microwatt Momentum Hackathon (2025)** under the theme:

> *“Microwatt for the Open Computing Era”*

The project demonstrates how custom compute extensions can be cleanly integrated into the Microwatt pipeline and implemented on the **ChipFoundry OpenFrame SoC** using the **SkyWater SKY130 PDK**.

---

## 🧩 Features

- ✅ Integrated **Custom Scalar Unit (CSU)** for INT8 and FP8 arithmetic
- ✅ Synthesizable **VHDL/Verilog** RTL compatible with OpenLane
- ✅ Verified using Microwatt’s testbench and a custom C program
- ✅ Passed DRC and GDS integrity checks in ChipFoundry Precheck
- ⚙️ Implemented and placed using OpenLane with timing closure on SKY130
- 🔍 Fully reproducible open-source flow (no proprietary tools required)

---

## 📁 Repository Structure

Microwatt-extension/
│
├── verilog/
│   ├── rtl/
│   │   ├── microwatt_core.v
│   │   ├── custom_scalar_unit.v
│   │   ├── user_proj_timer.v
│   │   ├── openframe_project_wrapper.v
│   │   └── ...
│   ├── gl/
│   │   ├── custom_scalar_unit.v
│   │   ├── openframe_project_wrapper.v
│   │   └── ...
│   └── tests/
│       ├── core_tb.vhdl
│       ├── custom.c
│       ├── potato_uart.c
│       ├── powerpc.lds
│       └── makefile
│
├── gds/
│   ├── openframe_project_wrapper.gds
│   ├── custom_scalar_unit/custom_scalar_unit.gds
│   └── ...
│
├── lvs/
│   └── openframe_project_wrapper/
│       └── lvs_config.json
│
├── precheck_results/
│   ├── DRC PASSED
│   ├── LVS — In Progress
│   └── Documentation — Verified
│
├── dependencies/
│   └── pdks/sky130B/
│
├── makefile
├── LICENSE
└── README.md

---

## 🧠 Architecture

### 🔸 Custom Scalar Unit (CSU)
The CSU extends the Microwatt execution pipeline to perform INT8 and FP8 arithmetic in hardware:
- **INT8 ADD/SUB**
- **FP8 ADD/SUB (IEEE 754-like encoding)**
- Modular connection through the `execute1` stage
- Accessible as a custom instruction under a reserved opcode

### 🔸 Integration
- Modified decode and execute stages to recognize custom opcodes.
- Verified using a standalone test (`custom.c`) running on Microwatt simulation.

---

## 🧪 Verification & Testing

### 1. RTL Simulation
```bash
cd power/microwatt
./core_tb

Expected UART output:
[Custom FP8/INT8 Test]
INT8 ADD (10 + 3) = 13
INT8 SUB (10 - 3) = 7
FP8 ADD (1.5 + 2.5) = 4.0

2. Custom Test Program
Located under verilog/tests/custom/, the program tests:


INT8 and FP8 arithmetic


UART output via potato UART


3. ChipFoundry Precheck
CheckStatusKLayout DRC✅ PassedZero Area✅ PassedDocumentation✅ PassedLVS⚠️ Under refinement (config update in progress)

🛠️ Toolchain & Flow
StageToolSynthesisYosysPlace & RouteOpenLaneSimulationGHDLLayout & DRCKLayoutLVS & PrecheckChipFoundryPDKSkyWater SKY130BLanguageVHDL / Verilog / C

🤖 AI Design Process
Large Language Models (LLMs) such as GPT-5 were used during:


Architecture exploration of the Custom Scalar Unit


Code scaffolding for VHDL and C testbenches


Documentation and flow troubleshooting


All relevant LLM prompts and ChatGPT session excerpts have been retained and can be shared upon request for reproducibility.

🧾 Open Source License
This project is released under the Apache 2.0 License.
All source code, scripts, and configurations are publicly available for community use and extension.

🎥 Project Deliverables
DeliverableDescriptionRTLLocated in /verilog/rtl/GDS/gds/openframe_project_wrapper.gdsTestbenches/verilog/tests/custom/Simulation OutputUART log output validating INT8 & FP8Precheck Logs/precheck_results/DocumentationThis README + design notes

📸 Future Work


Full LVS closure with ChipFoundry precheck


Expanded verification coverage


Integration of multiply and vectorized extensions


Power and performance characterization



🧑‍💻 Author
Divya Sirobhushanam
Microwatt Momentum 2025 Participant
GitHub: divyasirobhushanam-commits

📚 References


Microwatt GitHub Repository


ChipFoundry OpenFrame Platform


Microwatt Momentum Challenge Page


OpenPOWER Foundation




---

Would you like me to add a short **“How to Reproduce This Project”** section (commands for building and simulating inside ChipFoundry + GHDL)?  
It’s an optional but high-value section that boosts your documentation score for the hackathon.

