🚀 FPGA Reaction Timer Game
📌 Project Overview
This FPGA-based project implements a reaction timer game, where a player must press a button as quickly as possible after a random delay. The reaction time is displayed on 3 LEDs.

The system:
✅ Uses a Finite State Machine (FSM) for game logic
✅ Implements a randomized delay before the reaction test
✅ Displays the reaction time using 3 LEDs
✅ Runs on the ICEBreaker FPGA, written in Verilog

⚡ Features
✅ Finite State Machine (FSM) Based Game Logic
✅ Randomized Reaction Time Start
✅ LED-Based Reaction Time Display
✅ Fully Synthesizable on ICEBreaker FPGA

📜 Hardware Requirements
🖥 ICEBreaker FPGA (Lattice iCE40UP5K)
🕹 Push Button (Onboard or External)
🔆 3 LEDs for Reaction Time Display
🔋 USB-C Power & Programming Cable

🛠 File Structure

FPGA_Projects/reaction_timer/
│── reaction_game.v            # Main Verilog module
│── constraints.pcf            # FPGA pin assignments
│── README.md                  # Project documentation
💾 Synthesis & Programming (ICEBreaker FPGA)

Use the following commands to synthesize and upload the design:

yosys -p "synth_ice40 -top reaction_game -json reaction_game.json" reaction_game.v
nextpnr-ice40 --up5k --package sg48 --json reaction_game.json --pcf constraints.pcf --asc reaction_game.asc
icepack reaction_game.asc reaction_game.bin
iceprog reaction_game.bin

🔍 How It Works
1️⃣ The game starts in cooldown mode (2 seconds).
2️⃣ After cooldown, the system waits a random time (1-3 sec) before setting the "Ready" LED.
3️⃣ The player must press the button as fast as possible after the ready signal.
4️⃣ The reaction time is displayed on 3 LEDs in binary format.
5️⃣ After 2 seconds, the game resets, and a new random wait time is generated.

🔬 Reaction Time Display (LEDs)
Reaction Time (Seconds)	LED Output (Binary)
0 sec (Instant)	000
1 sec	001
2 sec	010
3 sec	011
4 sec	100
5 sec	101
💡 Faster reaction times = fewer LEDs lit!


📌 Created by David Francos
Inspired by classic reaction time games and implemented in pure Verilog on an ICEBreaker FPGA.