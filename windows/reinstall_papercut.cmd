@ECHO off
mode con: cols=75 lines=40
"%~dp0/../resources/papercut/client-local-install.exe" /SILENT
SET PaperCutPath="%ProgramFiles(x86)%\PaperCut MF Client\pc-client.exe"
IF NOT EXIST %PaperCutPath% SET PaperCutPath="%ProgramFiles%\PaperCut MF Client\pc-client.exe"
START "" %PaperCutPath%
