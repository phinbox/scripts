#Run as admin if not admin already
#Sourced from http://stackoverflow.com/questions/7690994/powershell-running-a-command-as-administrator
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}

I:\LabView\Windows\LabView-2015\setup.exe labview.spec /qb /AcceptLicenses yes
