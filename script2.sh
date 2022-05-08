#!/bin/bash
#Script that collects the information about the operation system
rm osinf

#to show name of os
osName=`uname -n`
#to show kernel ID
kernelId=`uname -i`
#to list firewall rules
firewallRules=`sudo ufw status numbered`
#to display information about all network interfaces currently in operation that are active
activeNetInter=`ifconfig`
#to show the list of network interfaces and their IP addresses
listOfNetInter=`ip address show`

cd
echo -e " \033[32mOs name:\033[0m $osName\n \033[32mKernel Id:\033[0m $kernelId\n \033[32mFirewall rules:\033[0m $firewallRules\n \033[32mActive Network Interfaces:\033[0m\n$activeNetInter\n \033[32mList of network interfaces:\033[0m\n$listOfNetInter\033[0m\n " >> osinf

echo -e "Information was saved into $HOME/osinf "

#Output
#Os name: sasha-VirtualBox
#Kernel Id: x86_64
#Firewall rules: Status: inactive
#Active Network Interfaces:
#enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
#       inet 10.0.2.15  netmask 255.255.255.0  broadcast 10.0.2.255
#       inet6 fe80::c7bd:895e:89e5:4bac  prefixlen 64  scopeid 0x20<link>
#       ether 08:00:27:f3:52:8f  txqueuelen 1000  (Ethernet)
#       RX packets 512  bytes 85986 (85.9 KB)
#       RX errors 0  dropped 0  overruns 0  frame 0
#       TX packets 646  bytes 63529 (63.5 KB)
#       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
#       inet 127.0.0.1  netmask 255.0.0.0
#       inet6 ::1  prefixlen 128  scopeid 0x10<host>
#       loop  txqueuelen 1000  (Local Loopback)
#       RX packets 431  bytes 41268 (41.2 KB)
#       RX errors 0  dropped 0  overruns 0  frame 0
#       TX packets 431  bytes 41268 (41.2 KB)
#       TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#List of network interfaces:
#1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
#   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#   inet 127.0.0.1/8 scope host lo
#      valid_lft forever preferred_lft forever
#   inet6 ::1/128 scope host 
#      valid_lft forever preferred_lft forever
#2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
#   link/ether 08:00:27:f3:52:8f brd ff:ff:ff:ff:ff:ff
#   inet 10.0.2.15/24 brd 10.0.2.255 scope global dynamic noprefixroute enp0s3
#      valid_lft 72944sec preferred_lft 72944sec
#   inet6 fe80::c7bd:895e:89e5:4bac/64 scope link noprefixroute 
#      valid_lft forever preferred_lft forever
