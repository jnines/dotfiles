#!/bin/bash
# shellcheck disable=SC1091,SC2154,SC2323
source "$HOME"/.config/ha.rc

dryer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$haUrl"/api/states/sensor.dtimer | jq '.state' | tr -d \")
washer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$haUrl"/api/states/sensor.wtimer | jq '.state' | tr -d \")

if [[ $washer == "Off" ]]; then
	wash_img="󰜪 "
else
	wash_img="󰜪 $washer"
fi

if [[ $dryer == "Off" ]]; then
	dry_img="󰤗"
else
	dry_img="󰤗 $dryer"
fi

echo "$wash_img $dry_img"
