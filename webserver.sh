#!/bin/bash

echo "Checking if logged user is root."

if [ "$EUID" -ne 0 ]
	then echo "Please use root user."
	exit
fi

echo "Beginning."

echo "Updating system."

apt update -y && apt upgrade -y

echo "Installing Apache."

apt install apache2 -y

echo "Installing unzip."

apt install unzip -y

echo "Changing directory to /tmp."

cd /tmp

echo "Downloading the files from Github."

wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

echo "Unzipping Files."

unzip main.zip

echo "Changing directory to the project's directory."

cd linux-site-dio-main

echo "Copying project to Apache's folder"

cp -R * /var/www/html/

echo "Done."
