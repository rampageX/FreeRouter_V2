#!/bin/sh
#Alex Top 100 Sites in China
#Author:Bi Qin
#Website:http://www.lifetyper.com
#Version:X00
set -x
echo -e "Choose Your DNS Sever As Below:\n\
##0##:Input My Own DNS\n\
##1##:114 DNS\n\
##2##:AliYun DNS\n\
##3##:CNNIC DNS\n\
##4##:Shanghai Unicom\n\
##5##:Ovear DNS\n\
##6##:Opener DNS\n\
Your Choice:"
read DNSCount
if [ $DNSCount = "0" ];
then
	echo "DNS IP:"
	read ChinaDNS	
elif [ $DNSCount = "1" ];
then
	ChinaDNS="114.114.114.114"
elif [ $DNSCount = "2" ];
then
	ChinaDNS="223.5.5.5"
elif [ $DNSCount = "3" ];
then
	ChinaDNS="1.2.4.8"
elif [ $DNSCount = "4" ];
then
	ChinaDNS="210.22.84.3"
elif [ $DNSCount = "5" ];
then
	ChinaDNS="60.190.217.130"
elif [ $DNSCount = "6" ];
then
	ChinaDNS="112.124.47.27"
else
	echo "Wrong Select,Using 114DNS As Default!"
	ChinaDNS="114.114.114.114"
fi

LocalOutput="./local.conf"
GfwOutput="./gfw.conf"
CDN_List="./LocalCDN.txt"
Custom_List="./LocalCustom.txt"
GFW_List="./GfwList.txt"
CR='\015'
if [ -f $LocalOutput ];
then
	rm -rf $LocalOutput
fi
if [ -f $GfwOutput ];
then
	rm -rf $GfwOutput
fi
echo "Autofix windows CR/LF issue in TXT file!"
tr -d $CR <$CDN_List >TempListA.txt
rm $CDN_List
mv TempListA.txt $CDN_List
tr -d $CR <$Custom_List >TempListB.txt
rm $Custom_List
mv TempListB.txt $Custom_List 
tr -d $CR <$GFW_List >TempListC.txt
rm $GFW_List
mv TempListC.txt $GFW_List
echo "##gfw.conf generated date:$(date)##" >>$GfwOutput
cat $GFW_List | while read SingleDomain
do
	echo "ipset=/$SingleDomain/vpn">>$GfwOutput
done
echo "##local.conf generated date:$(date)##" >>$LocalOutput
echo "##local.conf generated date:$(date)##"
echo "##All .CN Domain##" >>$LocalOutput
echo "##All .CN Domain##" 
echo "server=/cn/$ChinaDNS" >>$LocalOutput
echo "##Alexa Top500 In China##">>$LocalOutput
echo "##Alexa Top500 In China##"
for i in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 
do
echo -ne "\r# Generate dnsoption for Page $i##"
curl -s "http://www.alexa.com/topsites/countries;$i/CN" | grep "/siteinfo/"|\
grep -vE ".cn|twitter|tumblr|google|gmail|flickr|youtube|facebook|amazon|godaddy|wikipedia" |\
sed -e "s#^[^\/]*\/[^\/]*\/\([^\/]*\).*\".*#server=/\1/$ChinaDNS#g"\
>>$LocalOutput
done
echo "###Domain For China CDN###">>$LocalOutput
echo "###Domain For China CDN###"
cat $CDN_List|while read SingleDomain
do
	echo "server=/$SingleDomain/$ChinaDNS">>$LocalOutput
done
echo "###Domain For China Custom###">>$LocalOutput
echo "###Domain For China Custom###"
cat $Custom_List|while read SingleDomain
do
	echo "server=/$SingleDomain/$ChinaDNS">>$LocalOutput
done
exit 0
