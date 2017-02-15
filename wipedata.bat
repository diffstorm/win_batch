REM Drive wipe script by creating tiny files which overwrites the old data until there is no space in the drive


@setlocal enableextensions enabledelayedexpansion
@echo off
Title Your mind is clear...
set drive=D:
set extension=dat
:strt
set counter=2000
:top
set FN=%random%%random%%random%%random%
copy /Y "%~f0" %FN%.%extension%
set /a counter=%counter%-1
if %counter% LEQ 0 goto :end
goto :top
:end
for /f "tokens=3" %%a in ('dir %drive%\') do (
    set bytesfree=%%a
)
set bytesfree=%bytesfree:,=%
echo %bytesfree%
IF %bytesfree% GTR 99999 goto :strt
del *.%extension% /f /q /s
endlocal && set bytesfree=%bytesfree%
exit





REM lorem ipsum dolor sit amet consectetur adipiscing elit sed diam nonummy nibh euismod tincidunt ut
