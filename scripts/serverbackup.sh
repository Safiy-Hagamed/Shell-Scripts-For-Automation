#!/bin/bash

#======================================
# Author : Safiy
# Date : 26-01-2025
# Automate Backup a Directory From a Local Machine To Remote Machine
#======================================

#variables
source="/home/" #path of the Directory
destination="/home/" #user@ec2-public #ipv4 Address
pemkey="/path/of/key/" #pem key location
logfile="/var/log/backupec2.log" #log file name and destination

sendbackup() {
if [ ! -d "$destination" ]; then
	mkdir "$destination"
	rsync -avz -a "$pemkey" "$source" "$destination" > "$logfile" 2>&1
fi
}

#executig function
sendbackup
