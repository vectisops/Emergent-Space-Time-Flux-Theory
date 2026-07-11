# src/local_environment.ps1
Write-Host "Initializing ESFT Core Native Windows Environment..." -ForegroundColor Cyan

if (-not (Get-Command "python" -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Python is not installed or not in PATH. Aborting." -ForegroundColor Red
    exit
}

Write-Host "[+] Building isolated Python virtual environment (esft_env)..."
python -m venv esft_env

Write-Host "[+] Activating environment and installing core dependencies..."
.\esft_env\Scripts\activate
pip install -r requirements.txt

Write-Host "[+] Structuring offline data directories..."
$dirs = @(
    ".\telemetry\uas_ingestion\raw_logs",
    ".\telemetry\uas_ingestion\parsed_grids",
    ".\telemetry\rf_capture\raw_sweeps",
    ".\orchestration\local_db"
)
foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

Write-Host "ESFT Windows Environment successfully deployed." -ForegroundColor Green
