#!/bin/bash
#
# Scipt to install pixel desktop for PiStar 
# written by Daniel Tullis KD7RED

# Remount root as writable
sudo mount -o remount,rw /
sudo mount -o remount,rw /boot

# Update the apt sources
sudo apt update

# upgrade all packages
sudo apt full-upgrade -y

# Chown the .config dir
sudo chown -R pi-star:pi-star /home/pi-star/.config

# Force the disk to be RW on boot
sudo sed -i 's/mount -o remount,ro \///g' /etc/rc.local

#install x11 dev
sudo apt install libx11-dev

#install pixel desktop
sudo apt --reinstall install raspberrypi-ui-mods -y

#install firefox
sudo apt install firefox-esr -y

#install hamradio menu
sudo apt install hamradiomenus -y

#reboot system
sudo reboot
