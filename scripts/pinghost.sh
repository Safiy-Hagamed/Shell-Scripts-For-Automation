#!/bin/bash

#=====================================
# Name : Safiy
# Ping a host to check success/failure and mails it
# Usage : ./pinghost.sh <example.com>
#====================================

# Variables
hostsite=$1
email_id=safiyhagamed@gmail.com

if [ -z "$hostsite" ]; then
  echo "Error: No host provided. Usage: ./pinghost.sh <host>"
  exit 1
fi

# Function for ping check
checkping() {
  ping -qc 5 "$hostsite"
  if [ $? -ne 0 ]; then
    echo "$hostsite failed to connect" | mail -s "Report: Host ping error" "$email_id"
  else
    echo "$hostsite is reachable." | mail -s "host reachable sy" "$email_id"
  fi
}

# Executing function
checkping
