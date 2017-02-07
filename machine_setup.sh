#!/bin/bash

PC=true # Tells whether this script is used on PC or laptop.

# Packages which are installed on both PC and laptop.
PKGS_COMMON=(
    vlc
    firefox
    lm-sensors
    unity-tweak-tool
    gnupg
    qbittorrent
)

# Terminal text colors
TXT_STD='\033[0m' # Standard - no color
TXT_GREEN='\033[0;32m' # Green

echo -n -e "${TXT_GREEN}###${TXT_STD} Enter computer type (pc/lt): "
read COMPUTER_TYPE

if [ $COMPUTER_TYPE == "pc" ]; then
    PC=true
elif [ $COMPUTER_TYPE == "lt" ]; then
    PC=false
else
    echo "Invalid computer type."
    exit 1
fi

echo -e "${TXT_GREEN}###${TXT_STD} Updating system."
sudo apt-get -y upgrade 
sleep 1
sudo apt-get -y update
sleep 1
sudo apt-get -y dist-upgrade
sleep 1

echo -e "${TXT_GREEN}###${TXT_STD} Installing packages."
sudo apt-get -y install ${PKGS_COMMON[@]}

#echo -e "${TXT_GREEN}###${TXT_STD} Setting up keyboard layouts."
#echo 'setxkbmap -option grp:alt_shift_toggle -variant ",latin," us,rs,rs' |
#sudo tee -a /etc/profile

