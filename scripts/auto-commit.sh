#!/bin/bash

#======================================
# Name    : Safiy Hagamed
# Purpose : Auto commit files to local git repo
#======================================

auto_commit() {
	local files_to_add=$1
	local user_msg=${2:-}
	local timestamp
	timestamp=$(date)
#Validate file parameter
	[[ -z "$files_to_add" ]] && { echo "Usage: $0 <files_to_add> [commit message]"; exit 1; }
	git add "$files_to_add"
#Use user_msg if provided; otherwise, just timestamp
	git commit -m "${user_msg:+$user_msg }$timestamp"
	echo "Successfully committed changes."
}

# Execute with user input arguments
auto_commit "$1" "$2"
