#!/bin/bash

#===========================================
# Author : safiy
# purpose : to resolve a domain's IP address
# usage : ./dns_resolver.sh google.com (a host address is required)
#===========================================

domain_name=$1

#error check
if [ $# -lt 0 ]; then
	echo "script requires a host name"
	exit 1
elif [ $# -gt 1 ]; then
	echo "use one host address at a time"
	exit 1
fi

check_dns() {
	ping -c 1 "$domain_name" | awk 'NR==2 {gsub(":", "", $4); print $4}'
}

check_dns $domain_name
