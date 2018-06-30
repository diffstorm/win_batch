REM Code formatter for C/C++ using AStyle.exe
@echo off
C:\AStyle\bin\AStyle.exe -j --mode=c --style=allman -xL -n -S -s4 -k3 -W3 -p -U --recursive *.c *.h *.cpp *.hpp

del /s /q /f *.bak