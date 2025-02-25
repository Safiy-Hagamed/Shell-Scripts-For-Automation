#!/bin/bash

#=====================================
# Name : Safiy
# Ping a host to check success/failure and mails it
# Usage : change the hostsite and email variable to desired value
#====================================

# Variables
hostsite="example.com"
email_id="example@mail.com"

check_ping() {
    if ! ping -qc 2 "$hostsite" >/dev/null 2>&1; then
        local message="$hostsite is unreachable!"
        echo "$message" | mail -s "$hostsite Ping Error" "$email_id"
    fi
}

# infinte loop for 10 seconds
while true; do
    check_ping
    sleep 10
done

#add the script to crontab  
