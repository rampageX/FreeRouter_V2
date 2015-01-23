#!/bin/sh
LOG='/tmp/vpn.log'
echo "\$Log: VPN Disconnect! @$(date +"%T@%Y-%m-%d")" >>$LOG
echo "\$Log: Remove IP rules for table 'vpn'! @$(date +"%T@%Y-%m-%d")" >>$LOG
ip rule del table vpn
