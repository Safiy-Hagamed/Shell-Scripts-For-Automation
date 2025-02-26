#!/bin/bash

#===============================
# Name : Safiy
# purpose : Replaces spaces in files with an underscore
#===============================

for files in */ *; do
replace=${files// /_}
mv "$files" "$replace" 2>/dev/null
done

echo "spaces are replaced with underscore"
