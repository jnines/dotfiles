#!/bin/bash

temp=$(sensors | awk '/Tctl:/{gsub("+","");print $2}')
echo "${temp%%.*}°| color=red size=13 imageURL=$HOME/.local/bin/kargos/amd.png bash='/usr/bin/plasma-systemmonitor' onclick=bash"
