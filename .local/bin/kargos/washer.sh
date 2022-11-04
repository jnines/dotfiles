#!/bin/bash
source "$HOME"/.config/ha.rc

washer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" $haUrl/api/states/sensor.washer_time_display | jq '.state' | tr -d \")

if [[ -z $washer ]]; then
    echo "| imageURL=$HOME/.local/bin/kargos/washer.png size=15"
else
    echo "$(echo "$washer" | awk -F ':' '{print " 0"$1":"$2}') | imageURL=$HOME/.local/bin/kargos/washer.png size=15"
fi