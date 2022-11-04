#!/bin/bash
source "$HOME"/.config/ha.rc

dryer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" $haUrl/api/states/sensor.dryer_time_display | jq '.state' | tr -d \")

if [[ -z $dryer ]]; then
    echo "| imageURL=$HOME/.local/bin/kargos/dryer.png"
else
    echo "$(echo "$dryer" | awk -F ':' '{print " 0"$1":"$2}') | imageURL=$HOME/.local/bin/kargos/washer.png"
fi
