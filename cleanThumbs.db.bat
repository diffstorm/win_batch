REM Remove all thumbs.db files

@echo off
cls
attrib /s -r -h -s thumbs.db
del /s /q thumbs.db
Pause
exit