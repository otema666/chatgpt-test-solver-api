@echo off

set "exe_name=clipboard.exe"

:main
tasklist /FI "IMAGENAME eq %exe_name%" | find /I "%exe_name%" > NUL
if %errorlevel% equ 0 (
    echo El programa ya está en ejecución
    pause
    exit
)
if exist %exe_name% (
    start /B %exe_name%
    echo Programa ejecutado
    pause
    exit
) else (
    gcc main.c -o clipboard.exe -mwindows -luser32 -lgdi32
    goto main
)
