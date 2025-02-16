#!/bin/bash

#============================================

# author  : safiy
# date    : 22-01-2025
# purpose : check disk partition usage and alert if it exceeds a specified limit

#============================================

# variable configuration
partition="/home" #change the /home to the desired partition of your device
max_limit=80
log_location="/home/"
log_file="$log_location/disk_utilization_alert.log"
date_string=$(date +%d-%m-%Y--%H:%M)
email_id=example@mail.com

# function to ensure log folder and file exist
ensure_log_setup() {
    if [ ! -d "$log_location" ]; then
        mkdir -p "$log_location"
    fi
    if [ ! -f "$log_file" ]; then
        touch "$log_file"
    fi
}

# function to check disk usage and log alerts
check_disk_usage() {
    local current_usage
    current_usage=$(df -h "$partition" | awk 'NR==2 {print $5}' | tr -d '%')

    if [ "$current_usage" -ge "$max_limit" ]; then
        ensure_log_setup
        echo " ${date_string} disk usage on $partition has exceeded ${max_limit}%. current usage: ${current_usage}%" \
            | tee -a "$log_file" && echo "Instance Disk Usage Exceeded its limit" | mail -s "Disk Usage Alert!!" -A "$log_file" "$email_id"
    else
	echo "${date_string} no action required" | tee -a "$log_file"
    fi
}

#executing Function
check_disk_usage
