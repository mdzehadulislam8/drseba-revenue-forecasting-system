@echo off
setlocal

echo Stopping services on ports 8000, 8001, 7777...
for %%P in (8000 8001 7777) do (
  for /f "tokens=5" %%I in ('netstat -aon ^| findstr :%%P ^| findstr LISTENING') do (
    taskkill /PID %%I /F >nul 2>&1
    echo Stopped PID %%I on port %%P
  )
)

echo Done.
endlocal
