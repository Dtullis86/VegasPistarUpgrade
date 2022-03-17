#!/bin/bash
# 
# written by Daniel Tullis aka KD7RED for Vegas PiStar Upgrade

#copy scripts and make executable.
sudo cp /home/pi-star/VegasPistarUpgrade/dmridupdate.sh /home/pi-star/dmridupdate.sh
sudo chmod +x /home/pi-star/VegasPistarUpgrade/dmridupdate.sh

#install desktop files
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/dmridupdate.desktop /usr/share/applications/dmridupdate.desktop 
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/reboot.desktop /usr/share/applications/reboot.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/shutdown.desktop /usr/share/applications/shutdown.desktop
sudo cp /home/pi-star/VegasPistarUpgrade/desktopfiles/hsdashboard.desktop /usr/share/applications/hsdashboard.desktop

#remove bad x11 video driver
sudo rm -rf /usr/share/X11/xorg.conf.d/99-fturbo.conf
