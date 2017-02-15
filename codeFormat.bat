REM Code formatter for C/C++ using AStyle.exe
@echo off
C:\AStyle\bin\AStyle.exe --options=none --mode=c --style=allman -j -xp -xy -c -z2 -xL -n -S -s2 -k3 -W3 -p -xe -U -f -Y -w -xW -Q -R %1/*.c %2/*.h