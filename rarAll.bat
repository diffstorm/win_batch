REM Compress with RAR all the files in directory

for /f "delims=  " %%i in ('dir *.exe /b') do "c:\program files\winrar\rar.exe" a -m5 "%%i".rar "%%i"