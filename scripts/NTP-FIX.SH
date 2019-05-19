#!/bin/bash
sudo echo "server 0.north-america.pool.ntp.org
server 1.north-america.pool.ntp.org
server 2.north-america.pool.ntp.org
server 3.north-america.pool.ntp.org" >> /etc/ntp.conf
sudo echo "[Time]
NTP=ntp.pool.ntp.org 1.ro.pool.ntp.org
FallbackNTP=ntp.ubuntu.com 0.arch.pool.ntp.org" >> /etc/systemd/timesyncd.conf

sudo timedatectl set-ntp true 
timedatectl status
