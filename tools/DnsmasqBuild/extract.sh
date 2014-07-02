#!/bin/sh
ConfFile="./gfw.conf"
TextFile="./GfwList.txt"
sed 1d $ConfFile| sort | sed -e "s#^[^\/]*\/\([^\/]*\)\/.*\$#\1#g" >$TextFile
