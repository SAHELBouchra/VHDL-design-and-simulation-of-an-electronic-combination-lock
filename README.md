# VHDL-design-and-simulation-of-an-electronic-combination-lock

<p align="center">
<img width="353" height="142" alt="image" src="https://github.com/user-attachments/assets/4bb6fdce-53b6-4881-ae88-16ca993e751e" />
</p>

## 📘 Introduction

This project presents the design and simulation of a **digital combination lock** system using **VHDL**, implemented on a **Cyclone V FPGA**. The system takes a 4-digit code input via a 16-key keypad, encodes and stores each digit, and compares the full sequence to a predefined key to determine access permission.

---

## 🧠 Objectives

- Design each component (encoder, detector, memory, comparator) in **VHDL**
- Simulate and validate functionality using **ModelSim**
- Integrate and test the system using **Quartus Prime**
- Deploy on a **Cyclone V FPGA board**

---

## 🧩 System Architecture

The system consists of the following main modules:

- **Encoders (4x)** – Convert one-hot 16-bit keypad input into 4-bit binary values  
- **Detectors (4x)** – Detect key presses  
- **Memory Block** – Stores the last 4 entered digits (16-bit total)  
- **Comparator** – Compares stored input with the predefined key (`1234`)

### 🖼 Architecture Diagram

![IMG-20240119-WA0003](https://github.com/user-attachments/assets/92f2d4fb-2de6-48db-a362-e96f9be01eff)


---

## 🧾 Keypad Input Table – Data Bus States

This table shows the 16-bit one-hot encoding sent by the keypad for each key pressed:

<img width="476" height="255" alt="image" src="https://github.com/user-attachments/assets/38d645af-f013-4ceb-a930-e78eeb5bb6e4" />


---

## 📦 Components Description

### ✅ Encoder
- Input: 16-bit one-hot code from keypad  
- Output: 4-bit binary index of the pressed key

### ✅ Detector
- Monitors input bus  
- Triggers a signal when a key is pressed

### ✅ Memory
- Stores the last 4 entered digits  
- Uses 4 shift registers (4 bits each)

### ✅ Comparator
- Compares 16-bit stored value with predefined key `16'h2C48` (equivalent to `1234`)  
- Outputs `S = 1` if correct, else `S = 0`

---

## 🧪 Simulation & Implementation

- **Simulation**: Using ModelSim  
- **Synthesis**: Using Quartus Prime  
- **Target FPGA**: Cyclone V – 5CGXFC7C6F23I7

### 📌 FPGA Pin Mapping

![IMG-20240119-WA0004](https://github.com/user-attachments/assets/55b897e3-f87f-4665-862d-5b94e6628c01)

---

## 💻 Tools Used

- **ModelSim** – Simulation and waveform verification  
- **Quartus Prime** – FPGA design suite for synthesis and layout  
- **VHDL** – Design language  
- **Cyclone V FPGA** – Target hardware

---

## 🚀 How It Works

1. User inputs 4 digits using a keypad.  
2. Inputs are encoded and stored into memory sequentially.  
3. Comparator checks stored sequence against `1234`.  
4. If match: output `S = 1` (unlock), else `S = 0`.




