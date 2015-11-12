#!/bin/sh
# 2013 Phinehas Bynum, St. Olaf College
# Postflight script to install and setup stoPrint and PaperCut on a Mac OS X 10.7+ system

# Get OS Version
osversion=$(sw_vers -productVersion | sed -e 's/\.//g')
ostrunc=${osversion//[-._]/}

# Universal Variables
printer_name_bw="stoPrint"
printer_name_color="stoPrint-color"
location_bw="Everywhere"
location_color="Rolvaag Reference, Tomson 1st Floor"
gui_name_bw="stoPrint"
gui_name_color="stoPrint-color"

# 10.7+ Variables
address_bw="lpd://printers.ad.stolaf.edu/stoPrint-LPR"
address_color="lpd://printers.ad.stolaf.edu/stoPrint-color-LPR"
driver_ppd_bw="/Library/Printers/PPDs/Contents/Resources/TOSHIBA_MonoMFP_X7.gz"
driver_ppd_color="/Library/Printers/PPDs/Contents/Resources/TOSHIBA_ColorMFP_X7.gz"

### Printer Installation ###
#If os version is greater than or equal to 10.7
if [ "$ostrunc" -ge '107' ]; then
	# Remove old stoPrint printers
	for i in $(lpstat -p | grep -i stoprint | awk '{print $2}'); do
		sudo lpadmin -x $(lpstat -p | grep -i stoprint | awk '{print $2}')
	done

	# Install the new stoPrint printers
	sudo /usr/sbin/lpadmin -p "$printer_name_bw" -L "$location_bw" -D "$gui_name_bw" -v "$address_bw" -P "$driver_ppd_bw" -E -o printer-is-shared=false
  sudo /usr/sbin/lpadmin -p "$printer_name_color" -L "$location_color" -D "$gui_name_color" -v "$address_color" -P "$driver_ppd_color" -E -o printer-is-shared=false

	# Enable and start the printers on the system
	sudo /usr/sbin/cupsenable $(lpstat -p | grep -i stoprint | awk '{print $2}')

	# Set stoPrint as the default printer for logged in user
	username=`logname`
	sudo -u "$username" lpoptions -d stoPrint

	# Setup PaperCut Client
	sudo find '/Applications/PCClient.app' -exec chmod 775 {} \;
	sudo osascript -e 'tell application "System Events" to make new login item at end with properties {path:"/Applications/PCClient.app", name:"PaperCut Client", hidden:false}'
	export PC_CLIENT_ARGS=-a; open -a /Applications/PCClient.app/Contents/MacOS/JavaAppLauncher --args biz.papercut.pcng.client.uit.UserClient

fi

exit 0
