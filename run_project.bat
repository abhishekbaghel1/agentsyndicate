@echo off
echo ===================================================
echo Cleaning up existing processes on ports 3000, 4000, 5000...
echo ===================================================

:: Kill processes on port 5000 (Lead Agent)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000 ^| findstr LISTENING') do (
    echo Killing process %%a on port 5000...
    taskkill /F /PID %%a 2>nul
)

:: Kill processes on port 4000 (Worker Node)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :4000 ^| findstr LISTENING') do (
    echo Killing process %%a on port 4000...
    taskkill /F /PID %%a 2>nul
)

:: Kill processes on port 3000 (Frontend)
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000 ^| findstr LISTENING') do (
    echo Killing process %%a on port 3000...
    taskkill /F /PID %%a 2>nul
)

echo.
echo Starting AgentSyndicate Services...
echo.

:: Start Lead Agent
start "AgentSyndicate - Lead Agent" cmd /k "cd lead-agent && call venv\Scripts\activate.bat && python main.py"

:: Start Worker Node
start "AgentSyndicate - Worker Node" cmd /k "cd worker && node index.js"

:: Start Frontend Next.js
start "AgentSyndicate - Frontend" cmd /k "cd frontend && npm run dev"

echo ===================================================
echo All services launched! You can close this window now.
echo ===================================================
pause
