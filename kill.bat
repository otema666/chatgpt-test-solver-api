@echo off

set "exe_name=clipboard.exe"

taskkill /F /IM "%exe_name%"
if "%ERRORLEVEL%"=="0" (    
    msg * Proceso %exe_name% finalizado con exito.
) else (
    msg * El proceso %exe_name% no esta en ejecucion.
)
