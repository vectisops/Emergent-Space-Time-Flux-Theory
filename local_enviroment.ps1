# src/local_environment.ps1
Write-Host "Initializing ESFT Core Local Environment on Windows..." -ForegroundColor Cyan

# Check if Python is installed
if (-not (Get-Command "python" -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Python is not installed or not in PATH." -ForegroundColor Red
    exit
}

# Create a Python Virtual Environment to keep dependencies isolated
Write-Host "Building isolated Python virtual environment..."
python -m venv esft_env

# Activate the environment and install dependencies
Write-Host "Activating environment and installing required packages..."
.\esft_env\Scripts\activate
pip install -r requirements.txt

# Create necessary local directories for offline data ingestion
Write-Host "Structuring offline data directories..."
New-Item -ItemType Directory -Force -Path ".\telemetry\uas_ingestion\raw_logs"
New-Item -ItemType Directory -Force -Path ".\telemetry\rf_capture\raw_sweeps"
New-Item -ItemType Directory -Force -Path ".\orchestration\local_db"

Write-Host "ESFT Environment successfully deployed." -ForegroundColor Green
Write-Host "To begin work, always activate your environment first: .\esft_env\Scripts\activate" -ForegroundColor Yellow
