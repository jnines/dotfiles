#!/bin/bash

wfile="$HOME"/.local/share/weather
current=$(curl -fs "wttr.in/?format=%c%t/%f" | sed -e 's/F//g;s/+//g;s/ //')
mapfile -t tday < <(sed '13q;d' "$wfile" | grep -o "m\\([-+]\\)*[0-9]\\+" | sort -n -t 'm' -k 2n | sed -e 1b -e '$!d' | tr 'm' ' ')
mapfile -t precip < <(sed '16q;d' "$wfile" | grep -wo "[0-9]*%" | sed 's/%//g')
    if [ "${precip[0]}" -ge 25 ] || [ "${precip[1]}" -ge 25 ]; then
        day="🌦"
    else
        day="🌞"
    fi
    
    if [ "${precip[2]}" -ge 25 ] || [ "${precip[3]}" -ge 25 ]; then
        night="🌧"
    else
        night="🌙"
    fi
echo "<body>${current}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${day}${tday[1]}&nbsp;&nbsp;${night}${tday[0]}</body> | size=15 bash='curl -fs "wttr.in/?1" > /home/jason/.local/share/weather' onclick=bash"
