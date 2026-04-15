$ports = 8000, 8001, 7777

$connections = Get-NetTCPConnection -State Listen -ErrorAction SilentlyContinue |
    Where-Object { $ports -contains $_.LocalPort } |
    Select-Object -ExpandProperty OwningProcess -Unique

if (-not $connections) {
    Write-Host 'No running service found on ports 8000/8001/7777.'
    exit 0
}

foreach ($procId in $connections) {
    try {
        Stop-Process -Id $procId -Force -ErrorAction Stop
        Write-Host "Stopped PID $procId"
    } catch {
        Write-Host "Failed to stop PID ${procId}: $($_.Exception.Message)"
    }
}
