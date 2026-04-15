$ErrorActionPreference = 'Stop'

$root = 'E:\Intern\Project work\Another'
$python = Join-Path $root '.venv\Scripts\python.exe'

if (-not (Test-Path $python)) {
    throw "Python not found in venv: $python"
}

$apiCmd = "Set-Location '$($root)\\api'; & '$python' main.py"
$uiCmd = "Set-Location '$($root)\\ui'; & '$python' manage.py runserver 0.0.0.0:7777 --noreload"

Start-Process -FilePath 'powershell.exe' -ArgumentList '-NoExit', '-Command', $apiCmd | Out-Null
Start-Process -FilePath 'powershell.exe' -ArgumentList '-NoExit', '-Command', $uiCmd | Out-Null

Write-Host 'Started API and UI in new PowerShell windows.'
Write-Host 'API Health: http://127.0.0.1:8000/health'
Write-Host 'Team URL:   http://192.168.0.101:7777/'
Write-Host 'Local URL:  http://127.0.0.1:7777/'
