#!/bin/sh
cp -f ./*.conf /etc/dnsmasq.d/
/etc/init.d/dnsmasq restart
