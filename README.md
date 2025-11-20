## 🛠️ Verilog Projects
This repository contains Verilog design and testbench projects that I built during my learning journey in Digital Design and VLSI fundamentals.  
Each project focuses on designing, simulating, and understanding hierarchical and structural modeling concepts using Verilog HDL.


---

✅ **PROJECT 1 – 2:1 Multiplexer (MUX2_1)**  
A basic digital circuit that:

- Selects between two input signals based on a single select line
- Outputs the chosen input
- Tested and verified using a functional testbench

📂 **Files included:**

- `MUX2_1.v` – Verilog design file
- `tb_MUX2_1.v` – Testbench file for simulation

🛠 **Tech:** Verilog HDL, simulation in Vivado, testbench design

---

✅ **PROJECT 2 – 2-input AND Gate (AND2_input)**  
A simple combinational circuit that:

- Computes logical AND of two single-bit inputs (`a` and `b`)
- Outputs the result (`c`)
- Verified by applying all input combinations in a testbench
- 📂 **Files included:**

- `AND2_input.v` – Verilog design file
- `tb_AND2_input.v` – Testbench file for simulation

🛠 **Tech:** Verilog HDL, simulation in Vivado, testbench design

---

✅ **PROJECT 3 – 16-to-1 Multiplexer (MUX16to1)**  
A hierarchical **structural design** of a 16:1 multiplexer built using smaller multiplexers.

### 🧩 Description:
- The **2-to-1 MUX** is designed using basic logic gates (`AND`, `OR`, `NOT`).
- The **4-to-1 MUX** is built using **three 2-to-1 MUXes**.
- The **16-to-1 MUX** is implemented using **five 4-to-1 MUXes**, demonstrating a clear hierarchical structure.
- Verified through a **functional testbench** in Vivado simulator.

### 📂 Files included:
- `mux16to1.v` – Verilog design file (includes 2:1, 4:1, and 16:1 modules)
- `tb_mux16to1.v` – Testbench file for simulation

### 🧪 Simulation Results:
- Successfully synthesized and simulated in **Xilinx Vivado 2025.1**  
- Waveform verified with correct output selection for different input combinations  
- Hierarchical schematic confirmed using synthesis view  

### ⚙️ Tools & Technologies:
- **HDL:** Verilog  
- **Software:** Xilinx Vivado 2025.1  
- **Modeling:** Structural Modeling  
- **Verification:** Testbench & waveform analysis  

---
**✅ PROJECT 4 – 16-bit Ripple Carry Adder (adder16bit)**
A hierarchical structural design of a 16-bit Ripple Carry Adder (RCA) built using smaller modular adders.

**🧠 Description:**

The 1-bit Full Adder is designed using basic logic gates (XOR, AND, OR).

The 4-bit Adder is implemented by connecting four Full Adders in series.

The 16-bit Adder is created by cascading four 4-bit Adders, forming a complete ripple-carry chain.

The design includes status flag outputs — sign, zero, carry, parity, and overflow.

Verified through a functional testbench in the Vivado simulator using multiple 16-bit input test vectors.

📂 **Files included:**

adder16bit.v – Verilog design file (includes Full Adder, 4-bit Adder, and 16-bit Adder modules)

tb_adder16.v – Testbench file for simulation

**🧪 Simulation Results:**

Successfully synthesized and simulated in Xilinx Vivado 2025.1

Waveforms verified for correct sum and flag generation

Hierarchical structure confirmed in RTL and Synthesized Schematics

FPGA implementation visualized using CARRY4 primitives for efficient carry propagation

**⚙️ Tools & Technologies:**

**HDL: Verilog
Software: Xilinx Vivado 2025.1
Modeling: Structural Modeling
Verification: Testbench & waveform analysis**
💡 *This project strengthened my understanding of hierarchical design, RTL synthesis, and structural modeling in Verilog HDL.*

#Verilog #VLSI #FPGA #XilinxVivado #DigitalDesign #RTLDesign #HDL #EngineeringProjects


---

**✅ PROJECT 5 – 16-bit Carry Look Ahead Adder**

A high-speed arithmetic circuit designed using a hierarchical and structural approach.

Computes the sum of two 16-bit binary numbers.

The high speed is achieved by calculating the carries in parallel using Generate (G) and Propagate (P) signals within 4-bit blocks.
The 16-bit adder is constructed by cascading four 4-bit CLA blocks.
Tested and verified through a functional testbench.

**Description:**
cla4 (4-bit CLA): This is the base structural block. It uses standard logic expressions to generate the internal carries (c1 ,c2 ,c3) directly from the Gi , Pi signals and the input carry (Cin), minimizing propagation delay.

cla16 (16-bit CLA): This module uses the structural modeling technique by instantiating four separate cla4 modules and connecting their carry outputs (Cout) to the next block's carry input (Cin) in a cascaded manner.

**Files included:**
16bit_cla.v – Verilog design file (includes cla4 and cla16 modules)

tb_16bit_cla.v – Testbench file for simulation

**Simulation Results:**
Successfully synthesized and simulated in a VLSI tool (e.g., Vivado/ModelSim).

Test cases verified correct sum (S) and carry-out (Cout) for various inputs, including overflow cases (e.g., FFFF + 0001).

Tools & Technologies:
HDL: Verilog

**Modeling**: Structural Modeling, Hierarchical Design

**Verification**: Testbench & waveform analysis

---

**✅ PROJECT 6 – Cyclic Lamp Controller (FSM Design)**

A sequential Moore FSM that cycles through Green → Yellow → Red lights on every clock pulse, implemented in Verilog and verified using Vivado simulation & synthesis.

**✨ Description:**

A 3-state Moore Finite State Machine is designed to control the lamp sequence.

The states represent:

S0 → GREEN (010)

S1 → YELLOW (001)

S2 → RED (100)

Output depends only on the current state, following Moore FSM rules. and State transitions occur at every positive edge of the clock.

Functional behavior confirmed using a testbench in Vivado simulator.Synthesized design shows one-hot state encoding using FDRE flip-flops.

**📁 Files Included:**

cyclic_lamp.v – Main FSM module (state register + next state logic + output logic) and test_cyclic_lamp.v – Testbench used for waveform simulation

**📊 Simulation Results:**

Successfully simulated in Xilinx Vivado 2025.1.

Waveform matches expected sequence:

GREEN (010) → YELLOW (001) → RED (100) → repeat...


Proper state transitions validated across entire simulation time. Timing behavior and cycle repetition verified.

**🧩 Synthesis Results:**

Vivado infers three FDRE flip-flops implementing one-hot state encoding.

Output logic optimized using LUTs.Clean RTL and Technology schematic generated after synthesis.

Global clock routing through IBUF → BUFG confirmed.

---

**🚀 PROJECT 7 – Serial Adder (FSM-Based Design in Verilog)**

This project implements a 1-bit Serial Adder using a Finite State Machine (FSM) in Verilog HDL. The design performs bit-by-bit addition of two binary numbers (A and B) along with carry handling, following Mealy machine principles. The complete design is simulated and synthesized using Xilinx Vivado, and the resulting RTL schematic confirms correct hardware generation.

**✨ Description**

The Serial Adder is built using a two-state FSM that keeps track of the carry at every clock cycle.
The two states represent:

**ZERO – No carry present**

**ONE – Carry is present**

At every positive clock edge, the circuit takes one bit from A and B (LSB first), calculates the sum, and determines whether the carry should be propagated to the next cycle. The output depends on both the present state and the current inputs, following Mealy machine behavior.The design correctly adds the example inputs A = 0110 and B = 0010, fed serially from LSB to MSB. Carry transitions between ZERO and ONE state as required, and the output bit stream is generated cycle-by-cycle.

**📂 Files Included**

**serial_adder.v** – RTL code for the FSM-based Serial Adder (carry logic + next-state logic + sum output).

**tb_serial_adder.v** – Testbench to simulate the sequential addition and verify waveform correctness.

Screenshots (to be added by user):Verilog code , Simulation waveform , Synthesized RTL schematic , schematic

**🧪 Simulation Results**

The design was simulated using Xilinx Vivado 2025.1. Waveforms clearly show correct serial addition behavior for the selected inputs. The sum output changes precisely at the clock edges, and the carry state switches between ZERO and ONE exactly as expected.

The simulation confirms:

Proper functioning of FSM-based carry tracking , Correct bit-wise addition for all input cycles , Stable and glitch-free output generation , Perfect Mealy-style timing response

**🛠 Synthesis Results**

The design was synthesized on the Artix-7 device (xc7a50tcsg324-1).
Vivado successfully inferred the FSM structure, implemented the carry flip-flop, and generated optimized LUT-based combinational logic for the next-state and output equations.

The RTL and Technology Schematics show: A clean representation of the FSM , Single flip-flop for carry state , Proper logic reduction by synthesis , No unwanted latches or redundant hardware , Stable routing with ease of timing closure

**🌱 Key Learnings**

Through this project, the following concepts were reinforced:Designing arithmetic circuits using FSMs ,Implementing serial addition in hardware , Modeling Mealy machines in Verilog , Writing effective Verilog testbenches , Understanding Vivado simulation and synthesis flow , Interpreting RTL schematic and hardware mapping

---

**🛠 Tools & Technologies:**

HDL: Verilog

Software: Xilinx Vivado 2025.1

Modeling: FSM (Moore Machine)

Verification: Testbench + Behavioral Simulation

Analysis: RTL Schematic & Waveform inspection

🚀 **How to run simulations**

- Open Vivado (or any Verilog simulator)
- Add the design and testbench files to your project
- Set the testbench as the top module
- Run simulation and observe waveform or console output

---

📌 **Upcoming improvements**

- Better folder organization (one folder per project)
- Waveform screenshots
- Markdown explanations for each module
- GitHub Actions to check code formatting

---

📜 **License**

Educational use only – feel free to fork and explore!

---

🤝 **Contributions**

Currently, this is a personal learning repo.  
In the future, I might open it for contributions to add more digital modules and testbenches.
