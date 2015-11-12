@ECHO off
mode con: cols=75 lines=40
SetLocal EnableExtensions EnableDelayedExpansion
REM Remove old St. Olaf printers
wmic printer get name | FINDSTR /i stoprint > %temp%\out.txt
for /f "tokens=1" %%a in (%temp%\out.txt) do RUNDLL32 PRINTUI.DLL,PrintUIEntry /dn /n %%a > nul
DEL %temp%\out.txt

REM Now add stoPrint and stoPrint-color and set stoPrint as default printer
ECHO Connecting to stoPrint and stoPrint-color...
ECHO.
REM Add stoPrint
RUNDLL32 PRINTUI.DLL,PrintUIEntry /in /n\\printers.ad.stolaf.edu\stoPrint
REM Default stoPrint
RUNDLL32 PRINTUI.DLL,PrintUIEntry /y /n\\printers.ad.stolaf.edu\stoPrint
RUNDLL32 PRINTUI.DLL,PrintUIEntry /in /n\\printers.ad.stolaf.edu\stoPrint-color
pause