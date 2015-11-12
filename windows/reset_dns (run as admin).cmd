@ECHO off
mode con: cols=75 lines=40
ECHO Flushing DNS...
ipconfig /flushdns >nul
ECHO Resetting DNS...
for /f "skip=2 tokens=3*" %%a In ('netsh interface show interface') do (netsh interface ip set dns name="%%b" dhcp & netsh interface ip show dns name="%%b")
pause