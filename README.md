# 🌐 6G Mobile Networks: Pervasive Orchestration, URLLC, Edge Computing & ICN

<p align="left">
  <img src="https://img.shields.io/badge/6G_Network-Research-blue?style=for-the-badge" alt="6G Network">
  <img src="https://img.shields.io/badge/URLLC-Ultra--Low_Latency-critical?style=for-the-badge" alt="URLLC">
  <img src="https://img.shields.io/badge/Edge_Computing-Distributed-blueviolet?style=for-the-badge" alt="Edge Computing">
  <img src="https://img.shields.io/badge/ICN-Information--Centric_Networking-success?style=for-the-badge" alt="ICN">
</p>

## 📌 Project Overview
This repository hosts a comprehensive simulation and analytical framework designed for next-generation **6G Mobile Networks**. The project focuses on the intersection of **Pervasive Orchestration**, **Ultra-Reliable Low-Latency Communications (URLLC)**, Multi-access **Edge Computing (MEC)**, and **Information-Centric Networking (ICN)**. 

By replacing legacy host-centric IP routing with ICN’s name-based data retrieval and deploying stateful content-caching strategies at the absolute network edge, this framework dramatically slashes end-to-end transport latency and minimizes core backhaul congestion—two core requirements for native 6G deployments.

---

## 🛠️ Core Research Pillars

### 1. Pervasive Orchestration
* **Concept:** Intelligently managing highly distributed computing resources across heterogeneous, resource-constrained edge cells down to User Equipment (UE).
* **Goal:** Dynamic workload migration and containerized function scaling to prevent processing bottlenecks before they break strict service SLAs.

### 2. URLLC (Ultra-Reliable Low-Latency Communications)
* **Concept:** Sub-millisecond scheduling paradigms and microsecond-level jitter control over high-frequency channels (e.g., mmWave and sub-THz).
* **Goal:** Achieving $99.999\%$ reliability architectures required for mission-critical applications like autonomous driving, industrial robotics, and remote surgery.

### 3. Edge Computing & Dynamic Slicing
* **Concept:** Deploying application logic and localized control planes closer to the end-user.
* **Goal:** Isolating physical resources into virtual slices tailored instantly to specific application demands, enabling native AI model processing at the edge.

### 4. Information-Centric Networking (ICN)
* **Concept:** Transitioning routing topologies from *where* the data resides (IP addresses) to *what* the data is (Content Names/Hashes).
* **Goal:** Leveraging localized Content Stores (CS), Pending Interest Tables (PIT), and Forwarding Information Bases (FIB) to turn every edge station into an intelligent routing cache.

---

## 📊 Framework Metrics & Comparative Benchmarking
The simulator built in this project evaluates the framework across four traditional content eviction policies (**LRU, LFU, FIFO, and Random**) mapped against variable Edge Node Cache Capacities.

The framework captures and evaluates the following Key Performance Indicators (KPIs):
* **Content Store Hit Ratio (%):** Tracks localized cache resolution efficiency.
* **Average End-to-End Latency (ms):** Validates the URLLC sub-millisecond envelope.
* **Network Path Stretch Factor:** Evaluates the reduction in logical hop-counts across the topology.
* **Core Backhaul Bandwidth Savings (%):** Quantifies core network transport relief.

### Performance Analysis Dashboard
Below is an example of the benchmark visualization generated natively by the analysis engine:

<p align="center">
  <img src="icn_metrics_comparative_analysis.png" width="850" alt="ICN Metrics Comparative Analysis Dashboard">
</p>

---

## 💻 Tech Stack & Simulation Tools

<p align="left">
  <img src="https://img.shields.io/badge/MATLAB-%23ED1C24.svg?style=for-the-badge&logo=MathWorks&logoColor=white" alt="MATLAB">
</p>

* **MATLAB & Simulink:** Used for 5G/6G physical layer link-level analysis, SimEvents packet queue modeling, and formal metric plotting.
* **ns-3 / ndnSIM:** Applied to scale deep network topology trees and test extensive name-prefix string routing tables.
* **Python (Ray/RLlib):** Deployed for distributed Machine Learning models controlling the pervasive edge orchestrator.

---

## 🚀 How to Run the Simulator

Follow these steps to run the 6G-ICN Caching Simulator and generate the publication-ready comparative metrics dashboard.

### 1. Prerequisites & Required Toolboxes
Before executing the scripts, ensure you have **MATLAB (R2021a or newer)** installed along with the following toolboxes:
* **5G Toolbox** (or the 6G Exploration Library) — For URLLC channel approximations.
* **SimEvents** — For discrete-event packet queue and interest management.
* **Reinforcement Learning Toolbox** — (Optional, used if expanding to adaptive pervasive orchestration).

### 2. Verify Directory Setup
Download or clone this repository. Ensure that all three core files are resting in the **same working directory/folder**. If the files are separated, MATLAB will throw an `Unrecognized function or variable` error.

```text
📁 Your-6G-ICN-Folder/
│
├── icn_cache_simulator.m          # Step 1: Core engine & workload generator
├── IcnCacheEngine.m               # OO Class blueprint (Do not run directly)
└── plot_icn_comparative_analysis.m # Step 2: Formal figures plotter

### Step-by-Step Execution
1. Clone this repository to your local directory:
   ```bash
   git clone [https://github.com/hussain1549/icn-cache-simulator.git](https://github.com/hussain1549/icn-cache-simulator.git)
   cd icn-cache-simulator
