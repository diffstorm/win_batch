REM Code formatter for C/C++ using AStyle.exe
@echo off
C:\AStyle\bin\AStyle.exe --options=none --mode=c --style=allman -j -xp -xy -c -z2 -xL -n -S -s4 -k3 -W3 -p -xe -U -f -Y -w -xW -Q -R *.c *.h *.cpp *.hpp
del /s /q /f *.bak