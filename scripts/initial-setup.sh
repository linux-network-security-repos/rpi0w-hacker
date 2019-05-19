#!/bin/bash
#
echo "Please set a secure password for root!"
sudo passwd root
if [ $USER != 'root' ]
then
   echo
   echo "Error: You are running as $USER - please run as root from the cmdline , disable the Desktop Login (raspi-config) and reboot, then do this."
   exit
fi

sudo apt-get update
sudo apt-get update && sudo apt-get upgrade -y
apt-get install linux-headers-$(uname -r) unattended-upgrades sudo tmux screen htop iftop ifstat curl wget git -y
apt autoremove -y

echo "Fin!";
