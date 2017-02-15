REM Clean IAR Embedded Workbench projects

@echo off
for /f "tokens=*" %%j in ('dir /B /s *.tmp') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.dep') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.wsdt') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.bak') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /d /r . %%d in (Debug Release _Debug) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
pause