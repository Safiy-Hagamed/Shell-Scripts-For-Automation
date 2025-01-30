#!/bin/bash

#===============================
# Author : Safiy
# change the service_name variable to desired service.
# This is a automated script so no arguments will be collected by the script
# This script is used to check the service status and restarts if its inactive
#===============================

# main function and logic
function check_service() {
local logfile=/var/log/servicecheck.log
local service_name=cron.service
serv_check=$(systemctl is-active "$service_name")

if [ "$serv_check" -eq "active" ]; then
	echo "service is active and running with no issues."
else
	(systemctl stop "$service_name" && echo "$(date)" && systemctl start "$service_name" --no-pager) >> $logfile 2>&1
fi
}

# executing funciton

check_service
