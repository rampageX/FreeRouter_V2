#!/bin/bash
cat /etc/resolv.conf |grep -v "#"|sed -e "s#^[^ ]* \([^ ]*\).*\$#\1#g"|xargs -i route add {} dev pptp-VPN
