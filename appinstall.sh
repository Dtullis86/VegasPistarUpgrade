#!/bin/bash
# 
# written by Daniel Tullis aka KD7RED for Vegas PiStar Upgrade

#copy scripts and make executable.
sudo wget https://raw.githubusercontent.com/km4ack/pi-scripts/master/getcall -O /home/pi-star/getcall
sudo cp /home/pi-star/VegasPistarUpgrade/dmridupdate.sh /home/pi-star/dmridupdate.sh
sudo chmod +x /home/pi-star/dmridupdate.sh
sudo chmod +x /home/pi-star/getcall

#install desktop files
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/dmridupdate.desktop /usr/share/applications/dmridupdate.desktop 
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/reboot.desktop /usr/share/applications/reboot.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/shutdown.desktop /usr/share/applications/shutdown.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/hsdashboard.desktop /usr/share/applications/hsdashboard.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/chirp.desktop /usr/share/applications/chirp.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/wsjtx.desktop /usr/share/applications/wsjtx.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/getcall.desktop /usr/share/applications/getcall.desktop

#add applications
sudo apt update
sudo apt install -y wjstx chirp rpi-imager yad
