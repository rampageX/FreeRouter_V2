#!/bin/sh
ConfFile="./gfw.conf"
TextFile="./GfwList.txt"
sort $ConfFile | sed -e "s#^[^\/]*\/\([^\/]*\)\/.*\$#\1#g" >$TextFile
