REM Clean Windows 7 junk files for more space

@echo off

echo Cleaning system junk files, please wait…

del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\prefetch\*.*
rd /s /q %temp% & md %temp%
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"

del /Q /S "C:\Users\Public\*.*"

rmdir /Q /S "C:\Users\diffstorm\AppData\Local\Temp"
mkdir "C:\Users\diffstorm\AppData\Local\Temp"

rmdir /Q /S "C:\Users\diffstorm\AppData\LocalLow\Temp"
mkdir "C:\Users\diffstorm\AppData\LocalLow\Temp"

del /Q /S "C:\Users\All Users\Temp\*"

rmdir /Q /S "C:\ProgramData\TEMP"
mkdir "C:\ProgramData\TEMP"

del /Q /S "C:\$RECYCLE.BIN\*"

echo Done

pause