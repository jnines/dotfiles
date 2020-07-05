#!/bin/bash

temp=$(sensors | awk '/Tdie:/{gsub("+","");print $2}')
echo "${temp%%.*}° | color=red iconName=amd bash='/usr/bin/ksysguard' onclick=bash"
