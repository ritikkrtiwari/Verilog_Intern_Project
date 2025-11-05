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

💡 *This project strengthened my understanding of hierarchical design, RTL synthesis, and structural modeling in Verilog HDL.*

#Verilog #VLSI #FPGA #XilinxVivado #DigitalDesign #RTLDesign #HDL #EngineeringProjects
📂 **Files included:**

- `AND2_input.v` – Verilog design file
- `tb_AND2_input.v` – Testbench file for simulation

🛠 **Tech:** Verilog HDL, simulation in Vivado, testbench design

---

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
