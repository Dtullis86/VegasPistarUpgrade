VegasPistarUpgrade

Vegas Pi-Star Upgrade Mods Currently under Development by KD7RED

All mods in the respoitory will only work with Pi-Star. Not all scripts are necessary but can be used depending on your hardware setup. This has been tested on a RPI3B and Pi4/2gb
Current Known Bugs

Once installed adding wifi via the pi-star dashboard will not work.
Change Log.

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

Note. If you currenlty have Pi-Star operating is is highly recommned a backup be taken prior to running any of the scripts. Pi-Star will need to be installed to an SD card. HDD support has not been tested at this time. DSI monitors have not been tested. All Scripts provided are to be used at your own risk and are not suppported by the Pi-Star developers. PISTAR MUST BE COMPLETELY WORKING BEFORE IMPLEMENTING ANY SCRIPTS IN THIS REPO. The installation of ham clock can not be done full screen and is not supported by clearsykinstitute.com. Intructions assume that pistar has been flashed and configured prior to begining and have a keyboard and monitor attached.

    1) Login to the CLI and set pi-star to write mode using the command rpi-rw

    2) Clone repo using the command git clone https://github.com/Dtullis86/VegasPistarUpgrade

    3) We need to edit the boot config file before proceeding. This can be done via command line. 
        a) run the command sudo su 
        b) run the command rpi-rw 
        c) run the command nano /boot/config.txt 
        d) go the last line and remove the # e) press ctrl+x, then y, then enter f) type exit to leave root user mode

    4) Use the following command to set the expandfs.sh scirpt to executable. sudo chmod +x ./VegasPistarUpgrade/expandfs.sh

    5) Run script expandfs.sh script using command sudo ./VegasPistarUpgrade/expandfs.sh filesystem will be expanded and system will reboot

    6) Once the system has rebooted if you need to install the newest nextion driver plesae do so now. If not please skip to step 7.
        a) Set the file system to write mode by using the command rpi-rw
        b) The installation of the driver can be completed by running the command sudo ./VegasPistarUpgrade/NextionDriverInstaller/install.sh User intervention is required for this script and will will cause the system to reboot again.

    7) Once you are ready to install the gui please do so by using the command sudo ./VegasPistarUpgrade/installGUI.sh This command will take a while to run and will reboot the system when complete.

    8) Once the sytem has rebooted additional applicaations will need to be installed. Launch the teminal and run the appropriate script. The system will reboot again.
        a) If you are not using a x708board please use the command sudo ./VegasPistarUpgrade/appinstall.sh
        b) If you are using an x708board please run the command sudo ./VegasPistarUpgrade/x708files/x708install.sh

    9) Open terminal and enter sudo raspi-config. 
    10) Select System Options then boot. Then Select Desktop Autologin. This corrects an issue where the desktop does not load all the way on startup.

    11) open terminal and type in sudo raspi-config and go to system display options then screen blanking and disable it. This causes the display out to stop working and requires a hard reset of the device.
    
    12) We need to remove a corupt video drive. Run the following command sudo rm -rf /usr/share/X11/xorg.conf.d/99-fturbo.conf

    13) reboot the system with the command sudo reboot.

    This completes the basic install of the Vegas Pi-Star Upgrade. If you have a x708 board please continue if not You can install HamClock or an Alternative Dashboard below.

    12) Run the command sudo /usr/local/bin/x708softsd.sh to verify the installation of the x708 was successful. This will cause the raspberry pi and x708 to power down. If this happens the installation was successful. If not run the command listed in step 7 to repair the GUI installation and attempt the verification again.

    13) If the node shuts down verify the alias has been created. Run the command x708off. This will shut they system down again.
        a) if an error occurs run the command sudo printf "%s" "alias x708off='sudo /usr/local/bin/x708softsd.sh'" >> ./.bashrc
        b) reboot the system using the command sudo reboot. once the system has rebooted attempt step 13 again.

    14 )Now we need to edit the Pistar dashborad to use the x708scripts. Launch terminal and run the command to edit the power page of the pistar dashboard. sudo nano /var/www/dashboard/admin/power.php

        a) Locate the following line in the code. system('sudo sync && sudo sync && sudo sync && sudo mount -o remount,ro / > /dev/null &');

        b) edit the next line to be exactly exec('sudo /usr/local/bin/x708softsd.sh > /dev/null &');

        c) close and save the file.

    15) We need to enable the the auto safe shutdown by adding it to add it to rc.local 
        a) sudo su 
        b) open rc.local withe the command nano /etc/rc.local 
        c). at the bottom of the file just above exit 0 add the line /usr/local/bin/x708asd.py &
        d) reboot the system and installion of the x708 will be complete.

# INSTALLING HAMCLOCK.

to install HamClock please use the scripts listed below for the resolution that you would like.

    ./VegasPistarUpgrade/HamClockInstall/installhc800x480.sh

    ./VegasPistarUpgrade/HamClockInstall/installhc4600x960.sh

    ./VegasPistarUpgrade/HamClockInstall/installhc2400x1440.sh

    ./VegasPistarUpgrade/HamClockInstall/installhc3200x1920.sh

Vegas Pi-Star Upgrade with X708 is now complete


# Alternate Dashboard for Pistar.

An alterniative dashboard to the base PiStar can be found at Https://W0CHP.net. Please read his website before continuing.

    To install the dashboard use one of the following commands.

     a) With the default CSS for the for the new dashboard.
             curl -Ls https://w0chp.net/WPSD-Install | sudo env NO_SELF_UPDATE=1 bash -s -- -idc
     b) Without changing the current CSS.
             curl -Ls https://w0chp.net/WPSD-Install | sudo env NO_SELF_UPDATE=1 bash -s -- -id

    If you have already installed the x708board please redo steps 5 and 6 of the x708 install to correct the shutdown button.

    Once you have installed the dashboard you will need to run the script w0chpappinstall by using command sudo ./VegasPistarUpgrade/w0chpdashboard/w0chpinstall.sh

    To enable the Branmeister API that is part of the dashboard you will need to generate an API key. a) Follow the instructions at this website to do so. https://news.brandmeister.network/introducing-user-api-keys/

    Once you have generated the key edit the file bmapi.key using the command sudo nano /etc/bmapi.key a) delete the section , enter your key, and then save and exit the file by pressing ctrl+x then enter.
