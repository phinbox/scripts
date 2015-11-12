@ECHO off
mode con: cols=75 lines=40
REM Removing old St. Olaf credentials...
cmdkey /list | FINDSTR stolaf > %temp%\out.txt
for /f "tokens=2 delims=^=^" %%a in (%temp%\out.txt) do cmdkey /delete %%a > nul
DEL %temp%\out.txt

REM Adding St. Olaf credential...
SET /P USERNAME=Please enter your St. Olaf username and press 'Enter': 
cmdkey /add:*.stolaf.edu /user stoad\%USERNAME% /pass
ECHO.
pause