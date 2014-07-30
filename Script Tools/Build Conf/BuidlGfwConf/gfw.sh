#!/bin/sh
set -x
ConfFile="./gfw.conf"
CR='\015'
TextFile="./GfwList.txt"

if [ $1 = '--sort' ]
then
sed 1d $ConfFile | sort | sed -e "s#^[^\/]*\/\([^\/]*\)\/.*\$#\1#g" >$TextFile
fi

if [ -f $ConfFile ];
then
	rm -rf $ConfFile
fi

tr -d $CR <$TextFile >TempListC.txt
rm $TextFile
mv TempListC.txt $TextFile

echo "##gfw.conf generated date:$(date)##" >>$ConfFile
cat $TextFile | while read SingleDomain
do
	echo "ipset=/$SingleDomain/vpn">>$ConfFile
done
