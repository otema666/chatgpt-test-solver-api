@echo off

set exe_found=false

for /f %%i in ('forfiles /m *.exe /c "cmd /c echo @file"') do (
    set exe_found=true
    start /B "%%~ni" "%%i"
    msg * Programa en ejecucion

)

if "%exe_found%"=="false" (
    start create_exe.bat
)
exit
