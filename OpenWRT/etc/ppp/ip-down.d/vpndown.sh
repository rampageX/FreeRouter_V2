#!/bin/sh
LOG='/tmp/vpn.log'
echo "VPN Down @$(date +"%T@%Y-%m-%d" >>$LOG
ip rule del table 1
