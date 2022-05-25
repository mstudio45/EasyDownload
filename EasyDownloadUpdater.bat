@echo off
IF EXIST "%cd%\EasyDownload.exe" del "%cd%\EasyDownload.exe"
IF EXIST "%cd%\README.txt" del "%cd%\README.txt"
IF EXIST "%cd%\README.md" del "%cd%\README.md"
IF EXIST "%cd%\requirements.txt" del "%cd%\requirements.txt"
powershell -c "Invoke-WebRequest -Uri 'https://github.com/mstudio45/EasyDownload/raw/main/EasyDownload.exe' -OutFile '%cd%\EasyDownload.exe'"
powershell -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mstudio45/EasyDownload/main/README.md' -OutFile '%cd%\README.md'"
powershell -c "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/mstudio45/EasyDownload/main/requirements.txt' -OutFile '%cd%\requirements.txt'"
IF NOT EXIST "%cd%\ffmpeg.exe" (
	echo ffmpeg.exe missing... 
)
IF NOT EXIST "%cd%\ffplay.exe" (
	echo ffplay.exe missing... 
)
IF NOT EXIST "%cd%\ffprobe.exe" (
	echo ffprobe.exe missing... 
)
echo.
echo If any ffmpeg or any other files are missing open this link:
echo https://github.com/mstudio45/EasyDownload#how-to-setup-ffmpeg
echo.
echo Updated to the latest version!
pause