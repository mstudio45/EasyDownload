@echo off

REM This code is open source. Don't edit anything in this file unless you know what you are doing.


REM Check if file was runned as administrator.
REM Why? It will create files in system32 and we don't want that.

net session >nul 2>&1
if %errorLevel% == 0 (
	echo Please don't run this file as administrator.
	pause
	Exit /b 1
)

REM Remove old files.

IF EXIST "%cd%\EasyDownload.exe" del "%cd%\EasyDownload.exe"
IF EXIST "%cd%\README.txt" del "%cd%\README.txt"
IF EXIST "%cd%\README.md" del "%cd%\README.md"
IF EXIST "%cd%\requirements.txt" del "%cd%\requirements.txt"

REM Install new files with powershell command.

powershell -c "Invoke-WebRequest -Uri 'https://github.com/mstudio45/EasyDownload/raw/main/EasyDownload.exe' -OutFile '%cd%\EasyDownload.exe'"
powershell -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mstudio45/EasyDownload/main/README.md' -OutFile '%cd%\README.md'"
powershell -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mstudio45/EasyDownload/main/requirements.txt' -OutFile '%cd%\requirements.txt'"

REM Check if ffmpeg is installed.

IF NOT EXIST "%cd%\ffmpeg.exe" (
	echo ffmpeg.exe missing... 
)
IF NOT EXIST "%cd%\ffplay.exe" (
	echo ffplay.exe missing... 
)
IF NOT EXIST "%cd%\ffprobe.exe" (
	echo ffprobe.exe missing... 
)

REM Say some infomation.

echo.
echo If any ffmpeg or any other files are missing open this link:
echo https://github.com/mstudio45/EasyDownload#how-to-setup-ffmpeg
echo.
echo Updated to the latest version!
pause
