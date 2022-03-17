
#!/bin/bash

sudo apt-get update &&sudo apt install -y curl install make g++ libx11-dev xserver-xorg raspberrypi-ui-mods lightdm lxsession openssl

rm -fr ESPHamClock
curl -O https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip
unzip ESPHamClock.zip
cd ESPHamClock
make -j 4 hamclock-3200x1920
sudo make install
sudo mkdir /home/pi-star/.hamclock
sudo cp /home/pi-star/ESPHamClock/hamclock.png /home/pi-star/.hamclock/hamclock.png
sudo cp /home/pi-star/VegasPistarUpgrade/hamclockinstall/hamclock.desktop /usr/share/applications/hamclock.desktop
