#!/bin/bash
# lvs dr模式的 realserver 设置
# 绑定lo:0上

vip=192.168.8.100
proc=/proc/sys/net/ipv4/conf/

/sbin/ifconfig lo down
/sbin/ifconfig lo up

echo "2" > $proc/all/arp_announce
echo "1" > $proc/all/arp_ignore
echo "2" > $proc/lo/arp_announce
echo "1" > $proc/lo/arp_ignore 
echo "2" > $proc/eth0/arp_announce
echo "1" > $proc/eth0/arp_ignore 

/sbin/ifconfig lo:0 $vip broadcast $vip netmask 255.255.255.255 up
/sbin/route add -host dev lo:0
