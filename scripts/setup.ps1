# One-time environment setup for Windows: installs Ruby + DevKit (via winget) and gems.
$ErrorActionPreference = 'Stop'
Set-Location (Split-Path $PSScriptRoot -Parent)

function Refresh-Path {
  $env:Path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' +
              [Environment]::GetEnvironmentVariable('Path', 'User')
}

if (-not (Get-Command ruby -ErrorAction SilentlyContinue)) {
  Write-Host '[1/3] Ruby not found, installing Ruby+DevKit 3.3 via winget...' -ForegroundColor Cyan
  if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host 'winget not available. Please install Ruby+DevKit 3.3 manually from https://rubyinstaller.org/downloads/ and re-run.' -ForegroundColor Red
    exit 1
  }
  winget install -e --id RubyInstallerTeam.RubyWithDevKit.3.3 --accept-package-agreements --accept-source-agreements
  Refresh-Path
  if (-not (Get-Command ruby -ErrorAction SilentlyContinue)) {
    Write-Host 'Ruby installed but not on PATH yet. Close this window, open a new one and run setup.bat again.' -ForegroundColor Yellow
    exit 1
  }
} else {
  Write-Host "[1/3] Ruby found: $(ruby -v)" -ForegroundColor Green
}

Write-Host '[2/3] Installing MSYS2 toolchain (needed to compile some gems)...' -ForegroundColor Cyan
ridk install 3
if ($LASTEXITCODE -ne 0) { Write-Host 'ridk install failed.' -ForegroundColor Red; exit 1 }

Write-Host '[3/3] Installing gems (first run may take a few minutes)...' -ForegroundColor Cyan
if (-not (Get-Command bundle -ErrorAction SilentlyContinue)) { gem install bundler --no-document }
bundle config set --local path vendor/bundle
bundle install
if ($LASTEXITCODE -ne 0) { Write-Host 'bundle install failed.' -ForegroundColor Red; exit 1 }

Write-Host ''
Write-Host 'Done! Run serve.bat to preview the blog at http://localhost:4000' -ForegroundColor Green
