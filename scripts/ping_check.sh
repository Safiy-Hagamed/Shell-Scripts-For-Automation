#!/bin/bash

#====================
# Name : Safiy
# Purpose : to check ping of a server host for success rate
#========================

#variables
host_name=$1

#main function
checkhost() {
	ping $host_name -c 3
	if [ $? -eq 0 ]; then
		echo "failed to connect with the host"
	fi
}

checkhost
