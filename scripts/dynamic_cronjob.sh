#!/bin/bash

#-===================
# Author : Safiy
# purpose : To add/remove a cronjob dynamically
#-===================

current_cron() {
	echo "Current Cron jobs"
	crontab -l 2>/dev/null || echo "No Cron jobs found"
	echo "================================="
}

add_cron() {
	read -p "Enter the schedule <minutes hours dow dom *> -  " schedule
	read -p "Enter your command - " command
	if command -v $(echo $command | awk '{print $1}') >/dev/null 2>&1; then
		(crontab -l 2>/dev/null; echo "$schedule $command") | crontab -
		echo "cronjob added successfully"
		echo "================================="
	else
		echo "Invalid Command! Try Again"
		echo "================================="
	fi
}

remove_cron() {
	current_cron
	read -p "Enter the line number to delete cronjob: " line
	crontab -l | sed "$(line)d" | crontab -
	echo "crontab successfully removed"
	echo "================================="
}

#menu
echo "---------------------------------"
echo "1) View current cron jobs"
echo "2) add a cron job"
echo "3) remove a cron job"
echo "4) exit"
echo "---------------------------------"
while true; do
	read -p "Enter Your option - " choice
	echo "=================================="

	case $choice in
		1) current_cron ;;
		2) add_cron ;;
		3) remove_cron ;;
		4) echo "exiting script..."; break;;
		*) echo "Enter a valid option";;
	esac
done
