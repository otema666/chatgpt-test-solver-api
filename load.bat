@echo off

set "exe_name=clipboard.exe"

:main
tasklist /FI "IMAGENAME eq %exe_name%" | find /I "%exe_name%" > NUL
if %errorlevel% equ 0 (
    msg * El programa ya esta en ejecucion
) else (
    if exist %exe_name% (
        start /B %exe_name%
        msg * Programa ejecutado
    ) else (
        msg * clipboard.exe no encontrado, compilando mediante gcc...
        gcc main.c -o clipboard.exe -mwindows -luser32 -lgdi32
        goto main
    )
)