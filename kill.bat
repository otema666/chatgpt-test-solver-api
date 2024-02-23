@echo off

set exe_name=

for /f %%i in ('forfiles /m *.exe /c "cmd /c echo @file"') do (
    set "exe_name=%%~ni"
)

if "%exe_name%" neq "" (
    tasklist /FI "IMAGENAME eq %exe_name%.exe" 2>NUL | find /I /N "%exe_name%.exe">NUL
    if "%ERRORLEVEL%"=="0" (
        taskkill /F /IM "%exe_name%.exe"
        msg * El proceso %exe_name%.exe ha sido detenido.
    ) else (
        msg * El proceso %exe_name%.exe no esta en ejecucion.
    )
) else (
    msg * No se encontro ningun archivo .exe en el directorio.
)
