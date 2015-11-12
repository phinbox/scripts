@ECHO off
mode con: cols=75 lines=40
SetLocal EnableExtensions EnableDelayedExpansion
REM Map network drives
REM Removing previously mapped St. Olaf network drives...
for /f "skip=5 tokens=1*" %%a in ('net use') do (set str1=%%b & if not "x!str1:stofiles=!"=="x!str1!" net use %%a /delete /yes > nul)


ECHO Connecting to stoFiles...
ECHO.
SET /P USERNAME=Please enter your St. Olaf username and press 'Enter': 
SET INSTALLSDRIVE=I
call :mapDrive "HOME","H","\\stofiles.stolaf.edu\users\%USERNAME%",""
call :mapDrive "CLASSES","L","\\stofiles.stolaf.edu\classes",""
call :mapDrive "PRIME","P","\\stofiles.stolaf.edu\prime",""
call :mapDrive "SHARED","S","\\stofiles.stolaf.edu\shared",""
call :mapDrive "WEB","W","\\stofiles.stolaf.edu\www",""
call :mapDrive "INSTALLS","I","\\stofiles.stolaf.edu\prime\installs",INSTALLSDRIVE

pause
GOTO :EOF

::FUNCTIONS
:mapDrive
@echo off
ECHO Mapping %~1 (%~2:) drive...
IF NOT EXIST %~2:\. net use %~2: %~3 & GOTO :EOF
ECHO This drive is already in use.
ECHO Drive letters currently in use include...
ECHO.
for /f "skip=1 tokens=1" %%a in ('wmic logicaldisk get deviceid') DO echo(%%a 
SET /P %~2=Choose an unused drive letter (do not include a colon) for %~1 and press 'Enter': 
net use !%~2!: %~3
if not "%~4"=="" (
    SET %~4=!%~2!
)
GOTO :EOF