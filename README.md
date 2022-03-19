VegasPistarUpgrade

Vegas Pi-Star Upgrade Mods Currently under Development by KD7RED

All mods in the respoitory will only work with Pi-Star. Not all scripts are necessary but can be used depending on your hardware setup. This has been tested on a RPI3B and Pi4/2gb
Current Known Bugs

# Change Log.

2/13/22 initial upload to GIThub. x708 scripts are desinged to work with version 1.2 of the x708 board and Pistar Exclusivly. Automatic shutdown has not been implemented at this time as there has been no testing completed. Script has been included in the repo.

2/14/22 Corrected the expandfs.sh script to make the installGUI and x708install scripts executable. removed duplicate upgrade command from installGUI script

2/15/22 Corrected expandfs script syntax error. Removed installing applications in the installgui script it was causing a failure while installing. Added new script to install applications previously mentioned and updated expandfs script. Instructions updated

2/16/22 expandfs will download GIT repo for the updated nextion driver by ON7LDS and installation instructions have been updated instructions updated

2/17/22 added script to update the DMR ID stripped file and Brandmeister Talkgroups. Using this script will cause the system to reboot.

2/18/22 Added download for Hamclock and Updated installation instructions.

2/19/22 Added instructions on how to modify the pistar dashboard to use the x708softsd script. Add uploaded scrpts to be copied to the desktop to reboot and shutdown the system.

2/20/22 Automatic shutdown has been successfully tested. Instructions, expandfs, and x708asd have been updated from base on geekwork. Voltage shutdown is 3.25v and the system will check every 10 seconds.

2/23/22 corrected entry to get autoshut down working correctly. Added script to desktop for DMRID update and batery monitory via terminal.

2/24/22 corrected all scripts and instructions. Added option to modify pistar without an x708. Succesfully installed on a pi4

2/25/22 Changed desktop scripts to applications and updated scripts for standard and with x708 install.

2/26/22 Upgraded applicaiton scritps to install hamradio menu to application launcher and main menu editor

3/5/22 added instructions to disable screensaver and screen blanking. These items cause the video out ot stop working correctly and require a hard reboot of the device.

3/9/22 Moved application icons off desktop to application menus.

3/10/22 Updated instructions for edting the video drivers. Condensed the instuctions.

3/11/22 created hamclock install scripts for testing. Moved video driver edit to expandfs script. Moved edit of boot config to main part of instrutcions as this will be necessary if you want to use a dual monitor setup for Rpi4. Addes New potential dashboard for pistar

3/12/22 Added instructions and files for W0CHP PiStar Dashboard.

3/16/22 updated install for Hamclock
Installation Instructions

3/17/22 streamlined the install scripts and updated install directions.

3/19/22 streamlined scripts, updated hamclock scripts, added additonal programs to the build.

# Installation Instructions
Note. If you currenlty have Pi-Star operating is is highly recommned a backup be taken prior to running any of the scripts. Pi-Star will need to be installed to an SD card. HDD support has not been tested at this time. DSI monitors have not been tested. All Scripts provided are to be used at your own risk and are not suppported by the Pi-Star developers. PISTAR MUST BE COMPLETELY WORKING BEFORE IMPLEMENTING ANY SCRIPTS IN THIS REPO. The installation of ham clock can not be done full screen and is not supported by clearsykinstitute.com. Intructions assume that pistar has been flashed and configured prior to begining. It is recommened that a keyboard and monitor be connected to run all of the scripts.

1) Login to the CLI and set pi-star to write mode, clone Git repot and sent first script as executable.

```
rpi-rw && sudo git cline https://github.com/Dtullis86/VegasPistarUpgrade && sudo chmod +x ./VegasPistarUpgrade/expandfs.sh
```

2) We need to edit the boot config file before executing any scripts in the git repo. Once you have run the commands below you will need to go to the last line and remove the # to uncomment the configuration. Once complete. Press ctrl+x, Then y then type exit.

```
sudo su 
rpi-rw 
nano /boot/config.txt 
```

4) Run script expandfs script this will cause the system to reboot and set all necessary scripts to be executable.

```
sudo ./VegasPistarUpgrade/expandfs.sh filesystem will be expanded and system will reboot
```

5) Once the system has rebooted if you need to install the newest nextion driver plesae do so now. it will casue the system to remboot and may take 2 runs to get all of the functionality of your HMI file to be operational. User intervention is required durring the execution of the script. This is necessary as the driver included in Pistar is not up to date. If you do not need to update the driver please skip to step 6.

```
rpi-rw && ./VegasPistarUpgrade/NextionDriverInstaller/install.sh
```

6) Once you are ready to install the gui run the command below this will cause a reboot once complete. This command will take some time to complete

```
sudo ./VegasPistarUpgrade/installGUI.sh
```

7) Once the sytem has rebooted additional applicaations will need to be installed. Launch the teminal and run the appropriate script. The system will reboot again.
  a)If you are not using a x708board please use the command
```
sudo ./VegasPistarUpgrade/appinstall.sh
```

  b) If you are using an x708board please run the command 
  
```
sudo ./VegasPistarUpgrade/x708files/x708install.sh
```

8) Open terminal and use raspi-config editor using the command below. Select System Options then boot. Then Select Desktop Autologin. This corrects an issue where the desktop does not load all the way on startup. You will also want to set the localisations options at this time. When you close out of the raspi-confg do not reboot the system.

```
sudo raspi-config
```
    
9) Pistar uses a video driver that is not compatable with many applications. We need need to remove it and reboot the system. Run the following command. this command will also rebot the system.

```
sudo rm -rf /usr/share/X11/xorg.conf.d/99-fturbo.conf && sudo reboot
```

# This completes the basic install of the Vegas Pi-Star Upgrade. If you have a x708 board please continue if not You can install HamClock or an Alternative Dashboard below.

10) Run the command below to verify the installation of the x708 was successful. This will cause the raspberry pi and x708 to power down. If this happens the installation was successful.

```
x708off
```

If the node shuts down the scripts for the 708 board have been installed successfully. If not see additional troubleshooting documentation.     

11) Now we need to edit the Pistar dashborad to use the x708scripts. Launch terminal and run the command to edit the power page of the pistar dashboard. 

```
sudo nano /var/www/dashboard/admin/power.php
```
  a) Locate the following line in the code. system('sudo sync && sudo sync && sudo sync && sudo mount -o remount,ro / > /dev/null &');
  b) edit the next line to be exactly exec('sudo /usr/local/bin/x708softsd.sh > /dev/null &');
  c) close and save the file.

12) We need to enable the the auto safe shutdown by adding it to add it to rc.local
```
sudo su
rpi-rw
nano /etc/rc.local 
```

 At the bottom of the file just above exit 0 add the line
 
 ```
 /usr/local/bin/x708asd.py &
 ```
 Press Ctrl+x then enter to save the file then reboot the system and installion of the x708 will be complete.

```
sudo reboot
```

# INSTALLING HAMCLOCK.

To install HamClock please use the scripts listed below for the resolution that you would like.

```
./VegasPistarUpgrade/hamclockinstall/installhc800x480.sh
./VegasPistarUpgrade/hamclockinstall/installhc4600x960.sh
./VegasPistarUpgrade/hamclockinstall/installhc2400x1440.sh
./VegasPistarUpgrade/hamclockinstall/installhc3200x1920.sh
```


# Alternate Dashboard for Pistar.

An alterniative dashboard to the base PiStar can be found at Https://W0CHP.net. Please read his website before continuing.

1) To install the dashboard use one of the following commands.
  a) With the default CSS for the for the new dashboard.

```
curl -Ls https://w0chp.net/WPSD-Install | sudo env NO_SELF_UPDATE=1 bash -s -- -idc
```

  b) Without changing the current CSS.
```
curl -Ls https://w0chp.net/WPSD-Install | sudo env NO_SELF_UPDATE=1 bash -s -- -id
```

2) If you have already installed the x708board please redo step 11 of the x708 install to correct the shutdown button.

3)Once you have installed the dashboard you will need to run the script w0chpappinstall by using command below 

```
sudo ./VegasPistarUpgrade/w0chpdashboard/w0chpinstall.sh
```

4) To enable the Branmeister API that is part of the dashboard you will need to generate an API key. a) Follow the instructions at this website to do so. https://news.brandmeister.network/introducing-user-api-keys/

5) Once you have generated the key edit the file bmapi.key

```
sudo nano /etc/bmapi.key 
```

delete the section that says <key goes here> , enter your key, and then save and exit the file by pressing ctrl+x then enter.
