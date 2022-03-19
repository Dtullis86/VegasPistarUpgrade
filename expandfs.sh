#!/bin/bash
#
# Scipt to expand filesystem for PiStar 
# written by Daniel Tullis KD7RED

# Remount root as writable
sudo mount -o remount,rw /
sudo mount -o remount,rw /boot

#Download Nextion Display Installer
git clone https://github.com/on7lds/NextionDriverInstaller.git /home/pi-star/VegasPistarUpgrade/NextionDriverInstaller

#make necessary files executable
sudo chmod +x /home/pi-star/VegasPistarUpgrade/installGUI.sh
sudo chmod +x /home/pi-star/VegasPistarUpgrade/appinstall.sh
sudo chmod +x /home/pi-star/VegasPistarUpgrade/x708files/x708install.sh
sudo chmod +x /home/pi-star/VegasPistarUpgrade/w0chpdashboard/w0chpappinstall.sh
sudo chmod +x /home/pi-star/VegasPistarUpgrade/hamclockinstall/installhc*


#update & upgrade Pistar
pistar-update && pistar-upgrade

#expand filesystem
sudo pistar-expand

#reboot system
sudo reboot
