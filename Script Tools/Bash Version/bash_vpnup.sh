#!/bin/bash
cat /etc/resolv.conf |grep -vE "#|127.0.0.1"|sed -e "s#^[^ ]* \([^ ]*\).*\$#\1#g"|xargs -i route add {} dev pptp-VPN
