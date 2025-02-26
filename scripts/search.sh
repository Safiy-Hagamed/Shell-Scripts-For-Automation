#!/bin/bash

#=======================
# name : safiy
# purpose : to search a file using extension or by name in a directory
#=======================

#variables
filetype=$1

searchfile() {
	echo "============================"
	find . -type f -name "*$filetype*"
	echo "============================"
}

searchfile $filetype
