#!/bin/bash

# Confirm the user wants to use this script.


echo "This script will do the following: "
echo "1. Update and upgrade the system. "
echo "2. Setup flathub for you. "
echo "3. Install a theme for you if you wish."
echo 
echo "Would you like to run this script? y/n (hit enter to confirm.)"

# Confirm user response.
read response

if [[ "$response" == "y" || "$response" == "Y" ]]; then 
	echo "Script is running..."
	
	sudo apt update && sudo apt upgrade -y
	
	# If flatpak is not installed, install it 
	
	if ! command -v flatpak &>/dev/null; then
	echo "Flatpak is not your system, installing now..."
	sudo apt install flatpak -y
	else 
	echo "Hey there, flatpak is already installed!"
	fi
	echo
	echo "Continuing..."
	echo
	echo "Would you like to install a theme? y/n (hit enter to confirm)"
	
	read response
	
		if [[ "$response" == "y" || "$response" == "Y" ]]; then
    			echo "Please select which theme you would like to install. 1/2/3 (hit enter to confirm.)"
    			echo "1. Orchis Theme."
    			echo "2. Pop theme."
    			echo "3. Sweet theme."
    			
    			read response 
    			
    			if [[ "$response" == "1" ]]; then
    			echo
    			echo "Checking git is installed.."
    				if ! command -v git &>/dev/null; then
    				echo "Installing git!"
    				sudo apt install git -y
    				else
    				echo "Git is already installed!"
    				fi
    				
    			# Clone Orchis Theme repository
    			git clone https://github.com/vinceliuice/Orchis-theme.git
    			cd Orchis-theme
    			
    			# Run installation script
    			./install.sh
    			
    			echo "Orchis Theme has been applied to your system!"
    				
    			elif [[ "$response" == "2" ]]; then
    			
    			# Clone Pop Theme Repository
    			git clone https://github.com/pop-os/gtk-theme.git
    			cd gtk-theme
    			
    			# Install the dependencies for Pop Theme
    			sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf -y
    			
    			# Install the theme
    			sudo make install
    			
    			# Apply theme for user
    			echo "Applying Pop!_OS theme..."
    			
    			gsettings set org.gnome.desktop.interface gtk-theme "Pop"
    			gsettings set org.gnome.desktop.wm.preferences theme "Pop"
    			
    			# Go back to home directory 
    			cd ..
    			
    			echo "Pop theme has been installed and set for you!"
    			
    			elif [[ "$response" == "3" ]]; then
    			 
    			# Clone Sweet Theme Repository 
    			git clone https://github.com/EliverLara/Sweet.git
    			cd Sweet 
    			
    			# Install the dependencies for Sweet Theme
    			sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf -y
    			
    			# Copy theme to the theme directory 
    			
    			sudo cp -r Sweet /usr/share/themes/
    			
    			# Apply the theme
    			gsettings set org.gnome.desktop.interface gtk-theme "Sweet"
    			gsettings set org.gnome.desktop.wm.preferences theme "Sweet"
    			
    			# Go back to home directory 
    			cd ..
    			
    			echo "Sweet Theme has been applied to your system!"
    			
		else 
    			echo "No problem! Enjoy your new system"
		fi
	else
	
	
	echo
	echo
	echo "Will be installing Gnome Tweak Tool to help you with customising your system and change themes easily!"
	echo
	echo
	sudo apt install gnome-tweaks
	
	echo "No problem! Thanks for using the script!"

	fi
	
fi
