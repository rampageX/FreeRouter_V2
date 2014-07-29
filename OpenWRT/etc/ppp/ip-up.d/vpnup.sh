#!/bin/sh
LOG='/tmp/vpn.log'
echo "VPN UP @$(date +"%T@%Y-%m-%d")" >>$LOG
VPN_DEV=$(ifconfig | grep "pptp" | sed -e "s#^\([^ ]*\) .*#\1#g")
#echo "Add DNS servers to VPN route @$(date +"%T@%Y-%m-%d")" >>$LOG
#cat /etc/dnsmasq.d/server.conf|grep -vE "#|127.0.0.1"|sed -e "s#^[^ ]* \([^ ]*\).*\$#route add -host \1 dev "$VPN_DEV"#g" >>dns_route.sh
#/bin/sh dns_route.sh
#rm dns_route.sh
echo "Add VPN device for table vpn @$(date +"%T@%Y-%m-%d")" >>$LOG
ip route add default dev $VPN_DEV table vpn 
echo "Add IPs marked by firewall to table vpn @$(date +"%T@%Y-%m-%d")" >>$LOG  
ip rule add fwmark 1 priority 1984 table vpn
/etc/init.d/dnsmasq restart
