#!/bin/bash

temp=$(sensors | awk '/Tdie:/{gsub("+","");print $2}')
echo "${temp%%.*}°| color=red size=13 iconName=amd bash='/usr/bin/ksysguard' onclick=bash"
