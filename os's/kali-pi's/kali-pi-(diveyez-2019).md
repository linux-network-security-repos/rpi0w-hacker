# Raspberry Pi Kali Machine Building
If you have a _weak heart_, or hate _solving problems_, give up now. Use a VM instead as it is much more powerful and effective. However, if you are like me and want a *digital defense weapon* floating around in your pocket attached to _solar power_ with an **Alfa** network adapter _jamming into your buttox_ so your enemies and associates know you are a serious player, Please continue with me. **(ALL SARCASM)**

Over the last 5 years I have done this many times and I have acquired 50+ guides with different ways on how to achieve this. Some, but not all, of this information was randomly gathered at night when I was too tired to source it all properly. Sorry if you have had your rights infringed upon, hack my WPA and we will be even, okay?

This is to help _give birth to the inspiration_ that boils inside new tech minded **youngsters** who _WANT to learn_ how to do it **for the fun and innovation of it**. _*NO SPOON FEEDING.*_ _Consumer hacking is worthless and usually you will go to federal prison for this petty crime if you get caught_. **Do not hack anything you do not own**, seriously. Make your own targets, like your dads old PC. Put a *DAMN VULNERABLE LINUX OS* on it and go to town with the guides. **I will never show you how to hack anything so do not ask.**

#### Download the image you want/need

_RaspberryPi Foundation Boards_

https://www.offensive-security.com/kali-linux-arm-images/

**Name 	Torrent 	Size 	Version 	SHA256Sum**
```
Kali Linux RPi 	Torrent 	824M 	2019.1 	a4a950b5cd644638c062f83bd580babe880da5a3d8da1f1033c0ec1070400824
Kali Linux RPi0w Nexmon 	Torrent 	636M 	2019.1 	90449eb2bf06be075ae2e0504425a33297643e8a4f4964ee853f22a49f3f57d1
Kali Linux RaspberryPi 3 64 bit 	Torrent 	805M 	2019.1 	e5404de542469fd4cdabf4b0ccea976bfdfc40c19605771c613ebdd8c04c0b02
Kali Linux P4wnP1 Aloa 	Torrent 	997M 	2019.1 	78d664f3073253580aec0b244181374a82a44b6f78f2dbc52c64c95ef913506b
Kali Linux RaspberryPi 2 and 3 	Torrent 	824M 	2019.1 	8c9239370580b61fb56843f6fadf42853935adff0ce031387a02d9c379c0c3ef
```
Flash the image to your sd card using Balena Etcher
Then please login using user: root pw: toor
(port: 22 (If using headless))

Next, fix a bug.


**Warning: As stated by Kali Official Documentation all Kali Arm images are configured with the same SSH host key. The host keys must be changed by running: **
```
rm /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
service ssh restart
```
Due to the difficulty of installing truly headless with an active desktop, you will need to install your desktop for your vnc/hdmi/etc later. First, we need to do some house cleaning.

make a file called ntp-fix.sh
"nano ntp-fix.sh"
add these contents
```
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
```
type 'bash NTP-FIX.sh'
this fixes the stupid issue with the software clock thats emulating a hardware clock. It breaks everything.

## Updates (IMPORTANT!)
```
apt update && apt upgrade -y
```
*If it fails, that is likely due to the NTP being needed due to fake software clocks on hardware SBC's (STUPID DESIGN!!!)*


```



```


----
## XFCE Desktop ##
----
### How to install XFCE Desktop Environment in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base xfce4 xfce4-places-plugin xfce4-goodies
 ```
### How to remove XFCE in Kali Linux:
Code:
```
 apt-get remove xfce4 xfce4-places-plugin xfce4-goodies
 ```
----
## KDE Desktop ##
----
### How to install KDE Plasma Desktop Environment in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base kde-plasma-desktop
 ```
### How to install Netbook KDE Plasma Desktop Environment in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base kde-plasma-netbook
 ```
### How to install Standard Debian selected packages and frameworks in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base kde-standard
 ```
### How to install KDE Full Install in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base kde-full
 ```
### How to remove KDE on Kali Linux:
Code:
```
 apt-get remove kde-plasma-desktop kde-plasma-netbook kde-standard
 ```
----
## LXDE Desktop ##
----
### How to install LXDE Desktop Environment in Kali Linux:
Code:
```
 apt-get install lxde-core lxde kali-defaults kali-root-login desktop-base
```
### How to remove LXDE on Kali Linux:
Code:
```
 apt-get remove lxde-core lxde
 ```
----
## GNOME Desktop ##
----
### How to install GNOME on Kali Linux:
Code:
```
 apt-get install gnome-core kali-defaults kali-root-login desktop-base
 ```
### How to remove GNOME on Kali Linux:
Code:
```
 apt-get remove gnome-core
 ```
----
## Cinnamon Desktop ##
----
### How to install Cinnamon Desktop Environment in Kali Linux:
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base cinnamon
 ```
### How to remove Cinnamon Desktop Environment in Kali Linux:
Code:
```
 apt-get remove cinnamon
 ```
----
## MATE Desktop ##
----
### How to install MATE Desktop Environment in Kali Linux:
Code:
```
 echo "deb http://repo.mate-desktop.org/debian wheezy main" >> /etc/apt/sources.list && apt-get update
 ```
Code:
```
 apt-get --yes --quiet --allow-unauthenticated install mate-archive-keyring
 ```
### This installs the base packages
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base mate-core
 ```
### Or this to install mate-core and more extras
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base mate-desktop-environment
 ```
### Or this to install mate-core + mate-desktop-environment and even more extras.
Code:
```
 apt-get install kali-defaults kali-root-login desktop-base mate-desktop-environment-extra
 ```
# How to remove MATE Desktop Environment in Kali Linux:
Code:
```
 apt-get remove mate-core
 ```

**Now the only problem is MATE doesn't show the nice Kali Linux Menu. Fix posted by Silver Moon**

To fix this edit the following file.
Code:
```
 leafpad /etc/xdg/menus/mate-applications.menu
```
In the file go down to the section named Internet and add the following line
HTML Code:

<!-- Kali Linux Menu -->
<MergeFile type="path">applications-merged/kali-applications.menu</MergeFile>

So it should look something like this
HTML Code:

.....
 <!-- Internet -->
  <Menu>
    <Name>Internet</Name>
    <Directory>mate-network.directory</Directory>
    <Include>
      <And>
        <Category>Network</Category>
      </And>
    </Include>
  </Menu>   <!-- End Internet -->
<!-- Kali Linux  -->
  <MergeFile type="path">applications-merged/kali-applications.menu</MergeFile>
.....

Now save the file, Logout and Login back. The "Kali Linux" menu should display fine in Mate desktop's application menu.




**<begin Sourced: http://blog.sevagas.com/?VNC-to-access-Kali-Linux-on-Raspberry-Pi content>**


## VNC Server (TightVNC)

First you need to have a running Kali or other Debian based Linux distribution installed on Raspberry PI. I personally installed Kali 2 on Raspberry Pi 3. For that look at instruction on the Kali Official Documentation
The device must be connected to the Internet to install the required packages and be network accessible to the PC or phone where you install the VNC client.
SSH server must be available and running on the Raspberry Pi. The Raspberry Pi will act as SSH and VNC server.
I used Xubuntu as the client OS but any other are possible provided they support SSH tunneling and you can install a VNC client.

```
apt-get install tightvncserver
Install Autocutsel package to enable cut&paste between client and server:
apt-get install autocutsel
```

We will make a first run of VncServer to generate configuration files and VNC password.
``` vncserver :1 ```

We started an X session on display port 1, note that by default vncserver will attempt to start on display 0 which is already taken by the started Kali session used for local access
The first time you run vncserver, it prompts for a password (8 char max). Thats when you realize VNC sessions are not linked to Linux user authentication but relies on a single password (one of VNC insecurity problems)! You can later change that password using the vncpasswd command.

We can check the VNCserver is running by using ``` netstat -tupln ```

```

tcp    0   0  0.0.0.0:5901   0.0.0.0:*  LISTEN    Xtightvnc
tcp    0   0  0.0.0.0:6001   0.0.0.0:*  LISTEN    Xtightvnc
tcp    0   0  0.0.0.0:22       0.0.0.0:*  LISTEN    sshd

Port 5901 is VNC connection port, 6001 is X server for VNC.
```


### Client access

On the client machine, first install a VNC client such as xtightvncviewer.
```
apt-get install xtightvncviewer
```

To connect to the server use the command:
```
xtightvncviewer <rpi's.ip.101.420>:1
```

You may notice that the remote HMI is not responsive and really slow. To remediate to that, you can use some options to optimize the connection:
```
xtightvncviewer <rpi's.ip.101.420>:1 -compresslevel 9 -quality 4 -depth 8
```

### Configuration

We will configure VNC startup script to enable cut and paste. For that edit the file /.vnc/xstartup and add autocutsel line as below.
```
    #!/bin/sh
    xrdb $HOME/.Xresources
    xsetroot -solid grey
    autocutsel -fork
    # Fix to make GNOME work
    export XKL_XMODMAP_DISABLE=1
    /etc/X11/Xsession
```
You can restart your VNC server and check it is working.

### VNC over SSH

As mention on TightVNC man page, the problem about Xvnc is that it is not secure. As they write: “It’s recommended to restrict network access to Xvnc servers from untrusted network addresses. Probably, the best way to secure Xvnc server is to allow only loopback connections ... and to use SSH tunneling for remote access to the Xvnc server.”

#### Localhost only VNC server

We want all our traffic to go through an SSH tunnel. So we will ensure VNC related ports are not accessible on the network.
We have to start VNC server with next options:
```
vncserver :1 -geometry 1280x800 -depth 16 -localhost -nolisten tcp
```

The -locahost option will ensure VNC port 5901 is listening only on local interface, the -nolisten tcp option will disable the port 6001(X Server will not listen on the network).

Now our listening connections are:
tcp    0   0  127.0.0.1:5901   0.0.0.0:*  LISTEN    Xtightvnc
tcp    0   0  0.0.0.0:22          0.0.0.0:*  LISTEN    sshd

### SSH Tunnel

We will create an SSH tunnel by issuing the next command on client machine:
```
ssh -L 5901:localhost:5901 -N -f <distant_user>@<server_ip>
```

This command means SSH will listen on local port 5901 on client machine. Any connection to this port will be tunneled to port 5901 or the remote VNC server via SSH (port 22).

Now to connect to our raspberry pi VNC server we use the command:
```
xtightvncviewer localhost:1 -compresslevel 9 -quality 4 -depth 8
 ```

Note: So we have now to enter two passwords, first the distant user password, next the VNC password, it is much more secure. Not sure if that counts as double authentication though :-) !

### Startup script

This startup script is an adaptation of the one proposed by raspberrypi.org to enable the SSH tunneling.
```
    #!/bin/sh
    ### BEGIN INIT INFO
    # Provides: vncboot
    # Required-Start: $remote_fs $syslog
    # Required-Stop: $remote_fs $syslog
    # Default-Start: 2 3 4 5
    # Default-Stop: 0 1 6
    # Short-Description: Start VNC Server at boot time
    # Description: Start VNC Server at boot time.
    ### END INIT INFO

    USER=root
    HOME=/root
    export USER HOME

    case "$1" in
     start)
       echo "Starting VNC Server"
       /usr/bin/vncserver :1 -geometry 1280x800 -depth 16 -localhost -nolisten tcp
       ;;

     stop)
       echo "Stopping VNC Server"
       /usr/bin/vncserver -kill :1
       ;;

     *)
       echo "Usage: /etc/init.d/vncboot {start|stop}"
       exit 1
       ;;
    esac

    exit 0
```

You can test this script by issuing service vncboot start to start VNC server and service vncboot stop to stop it.
### Enable at startup

```
chmod 755 /etc/init.d/vncboot
update-rc.d vncboot defaults
To enable the script at machine boot:
chmod 755 /etc/init.d/vncboot
update-rc.d vncboot defaults
```

Now enjoy your remote access, and have fun!

**</end Sourced: http://blog.sevagas.com/?VNC-to-access-Kali-Linux-on-Raspberry-Pi content>**

# To Start VNC as Service
https://github.com/Re4son/RPi-Tweaks/tree/master/vncservice#vncservice
# To Configure Kali Pi's the Easy Way
https://github.com/Re4son/RPi-Tweaks/tree/master/kalipi-config
# To Tether (Pi-Tail)
https://github.com/Re4son/RPi-Tweaks/tree/master/pi-tail
# Avahi Switch
https://github.com/Re4son/RPi-Tweaks/tree/master/avahiswitch



# Bad Images? Some Alternates

These are updated weekly.
http://cdimage.kali.org/kali-weekly/

# KALI is Obsolete

You are not safe when using KALI LINUX.
It is filled with exploits, that is its purpose. Exploits.

If you are looking for secure, daily usage. Checkout ParrotSecOS.
I really hope ParrotSecOS makes it possible to put it on a Rpi0w, or I will have to do it.
