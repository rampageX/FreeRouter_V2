#!/bin/sh
set -x
ConfFile="./gfw.conf"
TextFile="./GfwList.txt"

if [ $1 = '--sort' ]
then
cat $ConfFile | sort |grep ipset|sed -e "s#^[^\/]*\/\([^\/]*\)\/.*\$#\1#g" >$TextFile
fi

rm -rf $ConfFile

cat $TextFile | while read SingleDomain
do
	echo "ipset=/$SingleDomain/vpn">>$ConfFile
	echo "server=/$SingleDomain/8.8.8.8">>$ConfFile
done
