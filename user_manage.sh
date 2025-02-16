#!/bin/bash

#====================================
# Author : Safiy
# Purpose : to add or remove users and assigning to groups
# This script uses arguments to execute eg (./user_acc.sh user1 group1 add)
#====================================

#variables
username=$1
group=$2
argument=$3
req_third_arg=$(echo "$3" | tr '[:upper:]' '[:lower:]')
#error message
if [ $# -ne 3 ]; then
	echo "Please enter required arguments <username> <group> <add/remove>"
	exit 1
fi

#function - LOGIC
user_add_remove() {
	if [ "$req_third_arg" == "add" ]; then
		sudo useradd -m -G "$group" "$username"
	elif [ "$req_third_arg" == "remove" ]; then
		sudo userdel -r "$username"
	else
		echo "invalid argument: use 'add' or 'remove'."
	fi
}

sudo_access() {
	if [ "$EUID" -ne 0 ]; then
		echo "This Script Requires Sudo Access"
	else
		user_add_remove
	fi
}

#executing
sudo_access
