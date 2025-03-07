#!/bin/bash

#==========================
# Author : safiy
# Uses file name as arguments to find out the count of errors in a file
#==========================

# Variables
file_name=$1

# logic
if [ $# -eq 0 ]; then
	exit 1
fi

if [ ! -f "$file_name" ]; then
	echo "File $file_name not found"
	exit 1
fi

error_count=$(grep -oiw "error" "$file_name" | wc -l)

echo "'$file_name' error count = $error_count"
