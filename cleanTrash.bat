REM Clean trash files script for a programmer

@echo off
for /f "tokens=*" %%j in ('dir /B /s *.l#*') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.b#*') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.s#*') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.tmp') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.dep') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.wsdt') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s *.bak') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /f "tokens=*" %%j in ('dir /B /s thumbs*.db*') do @if exist "%%j" echo "%%j" &&  del /Q "%%j"
for /d /r . %%d in (Debug Release _Debug) do @if exist "%%d" echo "%%d" && rd /s/q "%%d"
del *.$$$ /f /q /s
del *.lst /f /q /s
del *.obj /f /q /s
del *.sym /f /q /s
del *.sdb /f /q /s
del *.wat /f /q /s
del *.~* /f /q /s