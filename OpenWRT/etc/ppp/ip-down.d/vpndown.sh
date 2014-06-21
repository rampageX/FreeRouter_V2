#!/bin/sh
LOG='/tmp/v.log'
echo "VPN Disconnected! Remove table 1.." >>$LOG
ip rule del table 1
