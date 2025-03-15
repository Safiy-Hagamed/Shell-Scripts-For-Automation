#!/bin/bash

#==============================
# Author : Safiy
# Purpose : Checks for open ports on localhost
#===============================

check_port() {
	netstat -tuln | grep -Eo '[0-9]+$' | wc -l
}

if [ $(check_port) -ne 0 ]; then
	echo "available open ports : " $(check_port)
else
	echo "no available ports"
fi
