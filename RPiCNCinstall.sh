#update OS scripts/001-install-updates.sh
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

#install utilities scripts/002-install-utilities.sh
sudo apt-get install -y minicom
sudo apt-get install -y CuteCom
#remote desktop
sudo apt-get install -y xrdp

#install bCNC scripts/003-install-bCNC.sh
#per https://github.com/vlachoudis/bCNC/wiki/OS
#python --version  (need 2.7)
sudo apt-get install -y python-pip
sudo pip install pyserial --upgrade
sudo apt-get install -y python python-serial python-tk python-pmw python-imaging
git clone https://github.com/vlachoudis/bCNC.git bCNC
echo "[Desktop Entry]" > ~/Desktop/bCNC.desktop
echo "Version=1.0" >> ~/Desktop/bCNC.desktop
echo "Type=Application" >> ~/Desktop/bCNC.desktop
echo "Name=bCNC" >> ~/Desktop/bCNC.desktop
echo "Comment=bCNC Controller" >> ~/Desktop/bCNC.desktop
echo "Exec=/home/pi/bCNC/bCNC" >> ~/Desktop/bCNC.desktop
echo "Icon=bCNC.png" >> ~/Desktop/bCNC.desktop
echo "Terminal=false" >> ~/Desktop/bCNC.desktop
echo "StartupNotify=false" >> ~/Desktop/bCNC.desktop
echo "Name[en_US]=bCNC" >> ~/Desktop/bCNC.desktop
chmod 755 ~/Desktop/bCNC.desktop

#install nodejs scripts/004-install-node.sh
sudo apt-get remove -y nodejs
curl -sLS https://apt.adafruit.com/add | sudo bash
sudo apt-get install -y node

#install cncjs scripts/005-install-cncjs.sh
#from https://recordnotfound.com/cnc-js-cheton-71448
echo "prefix=~/.npm" >> ~/.npmrc 
cat ~/.npmrc
npm install -g socket.io
npm install -g socket.io-parser
npm install -g cncjs
export PATH=$PATH:~/npm/bin/
echo "[Desktop Entry]" > ~/Desktop/cncjs.desktop
echo "Name=Start CNC.JS(Run once, wait for terminal window to open)" >> ~/Desktop/cncjs.desktop
echo "Version=1.0" >> ~/Desktop/cncjs.desktop
echo "Comment=Launches application" >> ~/Desktop/cncjs.desktop
echo "Exec=/home/pi/.npm/bin/cnc" >> ~/Desktop/cncjs.desktop
echo "Icon=/usr/share/pixmaps/openbox.xpm" >> ~/Desktop/cncjs.desktop
echo "Terminal=true" >> ~/Desktop/cncjs.desktop
echo "Type=Application" >> ~/Desktop/cncjs.desktop
echo "Categories=Education" >> ~/Desktop/cncjs.desktop
chmod 755 ~/Desktop/cncjs.desktop

#add shortcuts scripts/006-copy-shortcuts.sh
#done in scripts instead
#git clone https://github.com/Protoneer/RPI-CNC-Config-Scripts.git
#cd RPI-CNC-Config-Scripts/
#cp -a shortcuts/. ~/Desktop

##install laserweb  ---did not test---
#sudo apt-get install -y build-essential python g++ make
#cd ~
#sudo git clone https://github.com/openhardwarecoza/LaserWeb.git
#cd LaserWeb
#sudo npm install -g serialport@1.6.1
#sudo npm install -g socket.io node-static

#install ChiliPeper scripts/008-install-ChiliPeper.sh
#check for new versions at https://github.com/chilipeppr/serial-port-json-server/releases
wget https://github.com/chilipeppr/serial-port-json-server/releases/download/v1.88/serial-port-json-server-1.88_linux_arm.tar.gz
tar -xzvf serial-port-json-server-1.88_linux_arm.tar.gz
#./serial-port-json-server to run it.
echo "[Desktop Entry]" > ~/Desktop/ChiliPeper.desktop
echo "Name=Start ChiliPeper json server" >> ~/Desktop/ChiliPeper.desktop
echo "Version=1.88" >> ~/Desktop/ChiliPeper.desktop
echo "Comment=Launches Application" >> ~/Desktop/ChiliPeper.desktop
echo "Exec=/home/pi/serial-port-json-server-1.88_linux_arm/serial-port-json-server" >> ~/Desktop/ChiliPeper.desktop
echo "Icon=/usr/share/pixmaps/openbox.xpm" >> ~/Desktop/ChiliPeper.desktop
echo "Terminal=true" >> ~/Desktop/ChiliPeper.desktop
echo "Type=Application" >> ~/Desktop/ChiliPeper.desktop
echo "Categories=Education" >> ~/Desktop/ChiliPeper.desktop
chmod 755 ~/Desktop/ChiliPeper.desktop

##install tightvncserver  ---did not test---
#from https://www.raspberrypi.org/documentation/remote-access/vnc/
#sudo apt-get install tightvncserver

##https://www.raspberrypi.org/forums/viewtopic.php?f=107&t=138223
##/dev/ttyS0 instead of /dev/ttyAMA0
##https://github.com/RPi-Distro/repo/issues/22
##https://openenergymonitor.org/emon/node/12311
##http://www.briandorey.com/post/Raspberry-Pi-3-UART-Overlay-Workaround
##http://www.briandorey.com/post/Raspberry-Pi-3-UART-Boot-Overlay-Part-Two
echo "dtoverlay=pi3-miniuart-bt" >> /boot/config.txt