#!/bin/bash
#===========================
# Name : Safiy
# Purpose : kills a process that has been given as argument
#===========================
process_value=$1

#function
terminate() {
	[[ $EUID -ne 0 ]] && { echo "Please use root."; exit 1; }
	[[ -z "$process_value" ]] && { echo "Please enter a valid process_name"; exit 1; }
	sudo systemctl kill --force "$process_value"
}

terminate "$process_value"
