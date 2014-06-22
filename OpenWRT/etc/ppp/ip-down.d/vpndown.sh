#!/bin/sh
LOG='/tmp/vpn.log'
echo "VPN Down @$(date +"%T@%Y-%m-%d" >>$LOG
ip rule del fwmark 1 table 1
ip rule del table 1
