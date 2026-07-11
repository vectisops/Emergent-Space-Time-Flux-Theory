#!/bin/bash
# src/local_environment.sh

echo -e "\e[36mInitializing ESFT Core WSL2/Linux Environment...\e[0m"

# Update package lists and install hardware dependencies for SDR
echo -e "\e[32m[+] Installing system-level SDR and USB dependencies...\e[0m"
sudo apt-get update
sudo apt-get install -y hackrf libhackrf-dev usbutils python3-venv python3-pip

# Create virtual environment
echo -e "\e[32m[+] Building Python virtual environment...\e[0m"
python3 -m venv esft_env_linux
source esft_env_linux/bin/activate

# Install Python requirements
echo -e "\e[32m[+] Installing framework dependencies...\e[0m"
pip install -r requirements.txt

# Build telemetry directories
echo -e "\e[32m[+] Structuring telemetry directories...\e[0m"
mkdir -p telemetry/uas_ingestion/{raw_logs,parsed_grids}
mkdir -p telemetry/rf_capture/raw_sweeps
mkdir -p orchestration/local_db

echo -e "\e[32mESFT Linux Subsystem successfully deployed. Ready for hardware passthrough.\e[0m"
