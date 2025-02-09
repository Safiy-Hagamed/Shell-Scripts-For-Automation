#!/bin/bash

#========================================
# Author : safiy
# Date : 24-01-2025
# Script to backup a folder inside a local machine
#=========================================

# Variables
folder_to_backup='/home/lyla/devops/'
backuplocation='/home/lyla/devops/'
backup_date=$(date +%d-%m-%Y_%H:%M)

# Change the variables to a proper allocated time
cron_job="* * * * * bash $0"

# Function to add a cron job
addcronjob() {
    (crontab -l 2>/dev/null | grep -q "$cron_job") || (crontab -l 2>/dev/null; echo "$cron_job") | crontab -
}
# Function to compress the backup folder
compress() {
    tar -czf "$backuplocation/$backup_date.tar.gz" -C "$(dirname "$folder_to_backup")" "$(basename "$folder_to_backup")"
}

if [ -d "$folder_to_backup" ]; then
	compress
	addcronjob
else
    echo "Error: Folder '$folder_to_backup' does not exist. Please update the 'folder_to_backup' variable."
    exit 1
fi
