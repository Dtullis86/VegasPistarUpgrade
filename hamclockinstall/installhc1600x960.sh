
#!/bin/bash

rm -fr ESPHamClock
curl -O https://www.clearskyinstitute.com/ham/HamClock/ESPHamClock.zip
unzip ESPHamClock.zip
cd ESPHamClock
make -j 4 hamclock-1600x960
sudo make install
sudo mkdir /home/pi-star/.hamclock
sudo cp /home/pi-star/ESPHamClock/hamclock.png /home/pi-star/.hamclock/hamclock.png
sudo cp /home/pi-star/VegasPistarUpgrade/HamClockInstall/hamclock.desktop /usr/share/applications/hamclock.desktop