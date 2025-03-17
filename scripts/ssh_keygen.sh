#!/bin/bash

#=======================
# Author : Safiy
# Purpose : generates a SSH key for specified user
#========================

#asking for username
read -p "Enter your username : " username

#Variables
userhome=$(eval echo ~$user_name)
ssh_location="$userhome/.ssh"
key_location="$ssh_location/id_rsa"

#checking if the user id exists
if id "$username" $>/dev/null; then
	echo "[+] user exists. proceeding...."
else
	echo "[-] user not exists....."
	exit 1
fi

#making directory
mkdir "$ssh_location"
chmod 700 "$ssh_location"

ssh-keygen -t rsa -b 4096 -N "" -f "$key_location"

#proper permissions
chwon -R $username:$username "ssh_location"
chmod 600 "$key_location"
chmod 644 "$key_location.pub"

#displaying the key
echo "[+] created SSH key Successfully....."
echo "SSH key for the user : $username"
cat "$key_location.pub"
