#!/bin/bash

#===============================
# Name : Safiy
# usage : give the host name as an argument for
#===============================

#variable
host_name=$1
email_id=example@mail.com

#function
checkping() {
	ping -q -c 4 "$host_name"
	sleep 10
	if [ $0 -eq 0 ]; then
		echo "host connect : success"
	else
		echo "Failure : can't connect to host." | mail -s "Ping Host Failure" "$email_id"
	fi
}

#executing function
checkping
