#!/bin/sh
# 2013 Phinehas Bynum, St. Olaf College
# Preflight script to install and setup stoPrint and PaperCut on a Mac OS X 10.7+ system.

# Quit PCClient.app if already running
proc = ps aux | grep '[P]CClient.app' | awk '{print $2}'
if ! [ proc ] ; then 
	sudo kill -9 "$proc"
fi

# Get OS Version
osversion=$(sw_vers -productVersion | sed "s:.[[:digit:]]*.$::g")
ostrunc=${osversion//[-._]/}

if [ "$ostrunc" -ge '107' ]; then

	if [ -d "/Applications/PCClient.app" ] ; then
		# sudo osascript -e "tell application \"PCClient\" to quit"
		sudo rm -rf /Applications/PCClient.app
		sudo rm -rf ~/Library/Preferences/PCClient
	fi

	# Delete old Toshiba drivers if present
	if [ -d "/Library/Printers/toshiba" ] ; then
		sudo rm -rf /Library/Printers/toshiba
	fi

	if [ -a "/Library/Printers/PPDs/Contents/Resources/TOSHIBA_MonoMFP_X4.gz" ] ; then
		sudo rm -f /Library/Printers/PPDs/Contents/Resources/TOSHIBA_MonoMFP_X4.gz
	fi

	if [ -a "/Library/Printers/PPDs/Contents/Resources/TOSHIBA_ColorMFP_X4.gz" ] ; then
		sudo rm -f /Library/Printers/PPDs/Contents/Resources/TOSHIBA_ColorMFP_X4.gz
	fi

	if [ -a "/Library/Printers/PPDs/Contents/Resources/TOSHIBA_MonoMFP_X7.gz" ] ; then
		sudo rm -f /Library/Printers/PPDs/Contents/Resources/TOSHIBA_MonoMFP_X7.gz
	fi

	if [ -a "/Library/Printers/PPDs/Contents/Resources/TOSHIBA_ColorMFP_X7.gz" ] ; then
		sudo rm -f /Library/Printers/PPDs/Contents/Resources/TOSHIBA_ColorMFP_X7.gz
	fi

fi

exit 0