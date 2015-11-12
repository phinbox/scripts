@echo off
echo This command will add a printer for all users. Please run as an administrator.
PAUSE
SET /P PRINTERNAME=Enter a printer name (dept-printername or stoPrint) and press 'Enter': 
rundll32 printui.dll,PrintUIEntry /ga /n\\printers.ad.stolaf.edu\%PRINTERNAME%
net stop spooler
net start spooler
echo Assuming there are no errors, the printer will be added within 30 seconds.