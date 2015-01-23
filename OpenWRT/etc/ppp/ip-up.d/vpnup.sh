#!/bin/sh
set -x
LOG='/tmp/vpn.log'
echo "\$Log: VPN Connected! @$(date +"%T@%Y-%m-%d")" >>$LOG
VPN_DEV=$(ifconfig | grep "pptp" | sed -e "s#^\([^ ]*\) .*#\1#g")
echo "\$Log: Add DNS servers to VPN route! @$(date +"%T@%Y-%m-%d")" >>$LOG
route add -host 8.8.8.8 dev $VPN_DEV
echo "\$Log: Add VPN device for table 'vpn'! @$(date +"%T@%Y-%m-%d")" >>$LOG
ip route add default dev $VPN_DEV table vpn 
echo "\$Log: Add IP marked by firewall to table 'vpn'! @$(date +"%T@%Y-%m-%d")" >>$LOG  
ip rule add fwmark 1 priority 1984 table vpn
/etc/init.d/dnsmasq restart
