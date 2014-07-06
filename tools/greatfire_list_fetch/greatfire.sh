#!/bin/sh
set -x
Output="./greatfire.conf"
if [ -f $Output ]
then
	rm  $Output
fi
Threshold=70
for i in 0 1 2 3 4 5 6 7 8 9
do
curl -s --insecure "https://zh.greatfire.org/search/alexa-top-1000-domains?page=$i"|  \
grep 'class="first"' | grep 'class="blocked"' | grep -vE "google"|\
sed -e "s#^[^\/]*\/\([^\"]*\)[^\%]*\%...\([^\%]*\)\%.*#\1 \2#g"|\
#awk '$2>='"$Threshold"' {printf $1 "\t" $2 "\n"}' 
awk '$2>='"$Threshold"' {print "ipset=/"$1"/vpn" }'\
>>$Output
done
