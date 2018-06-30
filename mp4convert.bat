@echo off
setlocal enableextensions enabledelayedexpansion

REM Batch video encoder script by Eray Öztürk | erayozturk1@gmail.com
REM Encodes all the given file types into H.264 mp4
REM It recursively finds the files and encodes using ffmpeg, then it changes filename.ext to filename_enc.ext
REM If the file encode fails, it renames the filename.ext to filename_raw.ext
REM It checks files ending with _enc and does not encode them once more
REM If the encoded file size is greater than the original file, it removes the encoded file
REM All the activity log can be found in the log file

REM How to find ffmpeg.exe?
REM Download and install the encoder from http://www.h264encoder.com/
REM That way you do not need to change the ffmpeg path below.

REM 1200k for high quality
REM 800k for normal quality

REM raw files above this size will be compressed
set rawbytesize=6000000

REM encoded files below this size will be deleted
set minbytesize=10000

REM ffmpeg.exe path
set path_ffmpeg="C:\Program Files (x86)\H.264 Encoder\ffmpeg.exe"

REM file extensions we are interesting - *.avi, *.mov, *.mp4, *.mpeg, *.mpg, *.wmv etc
set ext_file="*.mp4"

REM log file name
set flog="mp4log.txt"

REM extension of encoded file
set extoutput=.mp4

REM -----------------------------------------------------------------

echo "Encoding started" > %flog%

for /R %%f in (%ext_file%) do (

  set fname=%%~nf
  if /i not [!fname:~-4!]==[_enc] (

    echo " " >> %flog%
    echo "START------------ %%~f ------------" >> %flog%
  
REM Uncomment to leave the output file extension as it is
REM set extoutput=%%~xf
  
    for /f "delims=" %%U in ("%%~f") do set rawsize=%%~zU
    
    if !rawsize! GTR !rawbytesize! (
    
      %path_ffmpeg% -i "%%~f" -y -vcodec libx264 -b:v 1200k -f mp4 "%%~pf%%~nf_enc!extoutput!"
    
      echo "Encoded file created : %%~df%%~pf%%~nf_enc!extoutput!" >> %flog%
    
      if exist "%%~df%%~pf%%~nf_enc!extoutput!" (
    
        echo "File found %%~df%%~pf%%~nf_enc!extoutput!" >> %flog%
    
        for /f "delims=" %%A in ("%%~df%%~pf%%~nf_enc!extoutput!") do set "encsize=%%~zA"
    
        echo "Encoded file size is %%~zf -> !encsize!" >> %flog%
    
        if !encsize! GTR !minbytesize! (
		    if !encsize! GTR !rawsize! (
			   del "%%~df%%~pf%%~nf_enc!extoutput!"
			   echo "Original file is smaller" >> %flog%
			   echo "Encoded file removed : %%~df%%~pf%%~nf_enc!extoutput!" >> %flog%
			   rename "%%~f" "%%~nf_enc!extoutput!"
			) else (
               del "%%~f"
               echo "Original file removed : %%~f" >> %flog%
			)
        ) else (
            echo "Encoded file is invalid" >> %flog%
            del "%%~df%%~pf%%~nf_enc!extoutput!"
            echo "Encoded file removed : %%~df%%~pf%%~nf_enc!extoutput!" >> %flog%
            rename "%%~f" "%%~nf_raw!extoutput!"
        )
    
      ) else (
         echo "Encoded file does not exist : %%~df%%~pf%%~nf_enc!extoutput!" >> %flog%
         rename "%%~f" "%%~nf_raw!extoutput!"
      )
  	
    ) else (
       echo "File size is below raw limit : !rawsize!" >> %flog%
    )
    
    echo "END------------ %%~f ------------" >> %flog%

  ) else (
    echo "*** File is already encoded : %%~nf" >> %flog%
  )
  
)

echo "Encoding done" >> %flog%

REM -----------------------------------------------------------------
