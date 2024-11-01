*source the script & tarball* [Here](https://github.com/EXALAB)

*is just clear manual instruction*

**Get Termux**
[Here](https://github.com/termux/termux-app)

> use termux lock in notification
>
> release before exit termux
>

**Run Command**
> copy the command
>
```
pkg install x11-repo
```
>
```
pkg update
```
>
```
pkg upgrade
```
>
```
pkg install wget proot
```
>
```
termux-setup-storage
```
> Allow
>
```
pkg install termux-api nano
```

**Install**
>
```
wget https://raw.githubusercontent.com/shiru-ri/linuxcore/master/ubuntuos.sh && bash ubuntuos.sh
```

**Login**
>
```
./ubuntu.sh
```
> enter
>
```
apt update
```
>
```
apt upgrade
```
>
```
apt install apt-utils nano wget curl sudo
```

**Install Desktop Environment**
>
```
sudo apt install xfce4 xfce4-goodies sddm
```

> follow command
> 
> example more :
> 
> press enter 3-4x
> 
> select number
>
>example 51. indonesia
> 
> enter 51
>
> start slim window manager
>
```
sudo service sddm start
```

**Setup VNC**
 >
```
apt install tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer xorg
```

>
```
mkdir /.vnc
```
>
```
nano /.vnc/xstartup
```
> copy this
>
```
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4
```
> press termux ctrl + x
> 
> then press y
> 
> enter
>
```
chmod +x /.vnc/xstartup
```
>
```
export DISPLAY=":1" >> /etc/profile
source /etc/profile
```
>
```
vncpasswd
```
> enter password
> 
> view only password
> 
> press n
> 
> enter
>
```
nano /usr/local/bin/runvnc
```
> copy
>
```
export USER=root
export HOME=/root
tigervncserver -xstartup /usr/bin/x-session-manager -localhost yes :1 -geometry 1024x768 -depth 24
```
> ctrl + x
> 
> y
>
enter
>
```
chmod +x /usr/local/bin/runvnc
```
>
```
nano /usr/local/bin/stopvnc
```
> copy
>
```
export USER=root
export HOME=/root
tigervncserver -kill -cleanstale
```
>
```
chmod +x /usr/local/bin/stopvnc
```
> Run VNC
>
```
runvnc
```
> Download Real VNC Viewer on Playstore
>
> Open add +
>
> add address
>
```
localhost:1
```
> add name
>
> create
>
> set picture quality high
>
> connect
>
> enter password
>
> on remember password
>
> done
>
> Stop VNC

> disconnect vnc
>
> back termux
>
>
```
stopvnc
```
> exit from os
>
```
exit
```
> typing exit to exit termux
>
> release termux lock

**Remove**
>
```
wget https://raw.githubusercontent.com/shiru-ri/linuxcore/master/removeubuntu.sh && bash removeubuntu.sh
```
