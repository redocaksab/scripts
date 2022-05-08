#!/bin/bash
#Script that audits workstation

currUser=`whoami`
recentLog=`last | head -n 10`
uptime=`uptime`
topCpu=`ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head`
topMem=`ps -eo pid,ppid,cmd,%mem --sort=-%mem | head`
openPorts=`sudo netstat -tulpn | grep LISTEN`
VMusage=`sudo cat /proc/meminfo | grep -E 'MemTotal|MemFree|MemAvailable'`
diskSpace=`df -h`
echo -e "Current user: $currUser\nUptime: $uptime\nRecent logins:\n$recentLog\nTOP-10 processes by RAM:\n$topMem\nTOP-10 processes by CPU:\n $topCpu\nOpen TCP/UDP ports:\n$openPorts\nVirtual Memory usage:\n$VMusage\nUsage of disk space:\n$diskSpace\n"  > auditWorkstation
echo -e "\nAudit has been saved into $HOME/auditWorkstation"


#Output
#Current user: sasha
#Uptime:  18:14:14 up  5:19,  1 user,  load average: 0,10, 0,03, 0,01
#Recent logins:
#sasha    tty2         tty2             Sun May  8 12:58   still logged in
#reboot   system boot  5.15.0-27-generi Sun May  8 12:54   still running
#sasha    tty2         tty2             Sat May  7 20:47 - crash  (16:07)
#reboot   system boot  5.15.0-27-generi Sat May  7 20:46   still running
#sasha    tty2         tty2             Wed Apr 27 20:41 - crash (10+00:04)
#reboot   system boot  5.15.0-27-generi Wed Apr 27 20:40   still running
#sasha    tty2         tty2             Wed Apr 27 20:38 - crash  (00:02)
#reboot   system boot  5.15.0-27-generi Wed Apr 27 20:35   still running
#sasha    tty2         tty2             Wed Apr 27 20:26 - crash  (00:09)
#reboot   system boot  5.15.0-27-generi Wed Apr 27 20:25   still running
#TOP-10 processes by RAM:
#   PID    PPID CMD                         %MEM
#  1582    1400 /usr/bin/gnome-shell        10.5
#  2047    1400 /usr/libexec/gsd-xsettings   1.7
#  1849    1524 /usr/libexec/evolution-data  1.6
#  4311    1582 gjs /usr/share/gnome-shell/  1.5
#  2135    1400 /usr/libexec/gnome-terminal  1.4
#  1513    1400 /usr/libexec/gnome-remote-d  1.3
#  1948    1582 /usr/bin/Xwayland :0 -rootl  1.3
#  1566    1400 /usr/libexec/goa-daemon      0.9
#  4416    1400 /usr/libexec/tracker-extrac  0.7
#TOP-10 processes by CPU:
#    PID    PPID CMD                         %CPU
#  1582    1400 /usr/bin/gnome-shell         1.2
#  4416    1400 /usr/libexec/tracker-extrac  0.8
#  1963    1962 /usr/bin/VBoxClient --draga  0.2
#   400       1 /lib/systemd/systemd-oomd    0.1
#  2135    1400 /usr/libexec/gnome-terminal  0.1
#     1       0 /sbin/init splash            0.0
#     2       0 [kthreadd]                   0.0
#     3       2 [rcu_gp]                     0.0
#     4       2 [rcu_par_gp]                 0.0
#Open TCP/UDP ports:
#tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      717/cupsd           
#tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      401/systemd-resolve 
#tcp6       0      0 ::1:631                 :::*                    LISTEN      717/cupsd           
#Virtual Memory usage:
#MemTotal:        4020204 kB
#MemFree:         1983384 kB
#MemAvailable:    2903892 kB
#Usage of disk space:
#Filesystem      Size  Used Avail Use% Mounted on
#tmpfs           393M  1,5M  392M   1% /run
#/dev/sda3        30G  9,0G   20G  32% /
#tmpfs           2,0G     0  2,0G   0% /dev/shm
#tmpfs           5,0M  4,0K  5,0M   1% /run/lock
#/dev/sda2       512M  5,3M  507M   2% /boot/efi
#tmpfs           393M  2,4M  391M   1% /run/user/1000
#/dev/sr0         59M   59M     0 100% /media/sasha/VBox_GAs_6.1.32
