#!/bin/bash

#===========================================
# Author : Safiy
# Purpose : create a random secure password
#===========================================

#variable
#secure_password=$(head /dev/urandom | tr -dc 'A-Z,a-z,0-9,@' > /dev/urandom | head -c16)
secure_password=$(openssl rand -base64 12)
echo "Your secure password : $secure_password"
