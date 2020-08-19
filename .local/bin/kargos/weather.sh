#!/bin/bash
source "$HOME"/.config/weather.rc
wfile="$HOME"/.local/share/weather
current=$(curl -fs wttr.in/$lat,$lon?format=%c%t/%f | sed -e 's/F//g;s/+//g;s/ //')
# If for some reason you use this, create $HOME/.config/weather.rc and add lat=whatever_lat and lon=whatever_lon
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

if [[ "${current}" =~ "Sorry"* ]]; then
    echo "<body>* ${day}${tday[1]}°&nbsp;&nbsp;${night}${tday[0]}°</body> | size=15 refresh=true"
else
    echo "<body>${current}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${day}${tday[1]}°&nbsp;&nbsp;${night}${tday[0]}°</body> | size=15 refresh=true bash='curl -fs wttr.in/$lat,$lon?1 > $HOME/.local/share/weather' onclick=bash"
fi
