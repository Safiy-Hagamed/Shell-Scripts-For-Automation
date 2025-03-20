#!/bin/bash

#==========================
# Author : Safiy
# Purpose : Fetch's machine ip address 
#==========================

#function
fetch_ip() {
	publicIP=$(curl -s https://api64.ipify.org)
	echo "Your IP Address is $publicIP"
}

fetch_ip
