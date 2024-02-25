@echo off

set "exe_name=clipboard.exe"

tasklist /FI "IMAGENAME eq %exe_name%" 2>NUL | find /I /N "%exe_name%">NUL
if "%ERRORLEVEL%"=="0" (
    taskkill /F /IM "%exe_name%"
) else (
    echo El proceso %exe_name% no esta en ejecucion.
)

pause
