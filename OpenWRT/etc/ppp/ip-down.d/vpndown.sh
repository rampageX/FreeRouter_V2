#!/bin/sh
LOG='/tmp/vpn.log'
echo "VPN disconnect@$(date +"%T@%Y-%m-%d")" >>$LOG
echo "Remove IP rules for table vpn @$(date +"%T@%Y-%m-%d")" >>$LOG
ip rule del table vpn
