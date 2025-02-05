#!/bin/bash

#=========================
# Author : Safiy
# Purpose : Sorts files on the working directory by its extension by moving them into a seperate folder
# STORE THIS SCRIPT INSIDE /USR/LOCAL/BIN/SORT_FILE AND USE THE COMMAND $SORT_FILE
#=========================

#Variables
SOURCE_DIR="$(pwd)"

# Loop through all files in the directory
for file in "$SOURCE_DIR"/*; do
	[ -d "$file" ] && continue #no folders
	ext="${file##*.}"
	[ "$ext" == "$file" ] && continue
	ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
	mkdir -p "$SOURCE_DIR/$ext"
	mv "$file" "$SOURCE_DIR/$ext/"
done

echo "Files sorted by extension in $(pwd)"
