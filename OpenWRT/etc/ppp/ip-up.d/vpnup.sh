#!/bin/sh
VPN_DEV=$(ifconfig | grep "pptp" | sed -e "s#^\([^ ]*\) .*#\1#g")
VPN_GW=$(ip route show dev $VPN_DEV | tail -n 1 |cut -d ' ' -f 1)
LOG='/tmp/v.log'
echo "Got VPN Device:$VPNDEV" >>$LOG
echo "Add IP with mark1 to table 1" >>$LOG
ip rule add fwmark 1 table 1
echo "Route DNS with VPN..." >>$LOG
ip route add 8.8.8.8 dev $VPN_DEV
ip route add 8.8.4.4 dev $VPN_DEV
ip route add 208.67.222.222 dev $VPN_DEV
ip route add 208.67.220.220 dev $VPN_DEV
echo "Got VPN Gate IP:$VPN_GW" >>$LOG
echo "Add table 1 to VPN Route" >>$LOG
ip route add default via $VPN_GW table 1
echo "Restart Dnsmasq" >>$LOG
/etc/init.d/dnsmasq restart

