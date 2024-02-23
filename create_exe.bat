@echo off

set /p exe_name=Ingrese el nombre del archivo ejecutable (sin la extension .exe): 

gcc main.c -o %exe_name%.exe -mwindows -luser32 -lgdi32

start load.bat

exit