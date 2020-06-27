#!/usr/bin/env bash

temp=$(sensors | grep -oP 'Tdie.*?\+\K[0-9.]+') 
echo "${temp%%.*}° | color=red bash='/usr/bin/ksysguard' onclick=bash"
