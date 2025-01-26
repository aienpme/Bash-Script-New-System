#!/bin/bash

#Confirm the user wants to use this script.


echo "This script will do the following: "
echo "1. Update and upgrade the system. "
echo "2. Setup flathub for you. "
echo 
echo "Would you like to run this script? y/n (hit enter to confirm."

#Confirm user response.
read response

if [[ "$response" == "y" || "$response" == "Y" ]]; then 
	echo "Script is running..."
	
	sudo apt update && sudo apt upgrade -y
	
	#If flatpak is not installed, install it 
	
	if ! command -v flatpak &>/dev/null; then
	echo "Flatpak is not your system, installing now..."
	sudo apt install flatpak -y
	else 
	echo
	echo
	echo "Hey there, flatpak is already installed!"
	echo "This script will now stop. Goodbye!"
	
	fi
	
	echo "Setup complete! Enjoy your new system!"

else 
	echo "Goodbye!"
	exit 1
fi

