#!/bin/sh
VPN_DEV=$(ifconfig | grep "pptp" | sed -e "s#^\([^ ]*\) .*#\1#g")
VPN_GW=$(ip route show dev $VPN_DEV | tail -n 1 |cut -d ' ' -f 1)
echo $VPN_GW
ip route add 8.8.8.8 dev pptp-VPN
ip route add default via $VPN_GW table 1
