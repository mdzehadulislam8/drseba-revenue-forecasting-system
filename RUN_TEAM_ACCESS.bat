@echo off
setlocal

set ROOT=E:\Intern\Project work\Another
set PY=%ROOT%\.venv\Scripts\python.exe

if not exist "%PY%" (
  echo [ERROR] Python not found in .venv: %PY%
  pause
  exit /b 1
)

echo Starting API on port 8000...
start "API-8000" /D "%ROOT%\api" "%PY%" main.py

echo Starting UI (team access) on port 7777...
start "UI-7777" /D "%ROOT%\ui" "%PY%" manage.py runserver 0.0.0.0:7777 --noreload

echo.
echo Services started.
echo Team URL: http://192.168.0.101:7777/
echo Local URL: http://127.0.0.1:7777/
echo API Health: http://127.0.0.1:8000/health
echo.
echo To stop all: run STOP_SERVERS.bat
endlocal
