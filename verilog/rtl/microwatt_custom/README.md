# Microwatt Custom Extension – Final Wrap-up

This folder contains the modified Microwatt VHDL files for the custom scalar unit extension project.

## Files Included
- `decode_types.vhdl` — Added new custom instruction opcodes.
- `decode1.vhdl` / `decode2.vhdl` — Added decode logic for new custom opcodes.
- `execute1.vhdl` — Connected execution path to the new scalar unit.
- `core.vhdl` — Integrated the custom unit into the Microwatt core.
- `custom_scalar_unit.vhdl` — VHDL description of the new custom scalar unit.
- `custom_scalar_unit.v` — Synthesized Verilog version of the custom unit.

## Description
This extension implements a **Custom Scalar Unit** integrated into Microwatt’s pipeline for scalar arithmetic operations.  
The decode, execute, and core units were modified to recognize and route new instruction types to this custom block.

## Notes
- All files are self-contained and can replace or extend the base Microwatt design.
- Tested using GHDL simulation and verified with custom instruction testbench.

Author: Divya  
Date: November 2025

