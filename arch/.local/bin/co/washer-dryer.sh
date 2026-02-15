#!/bin/bash
source "$HOME"/.config/ha.rc

dryer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" $haUrl/api/states/sensor.dryer_time_display | jq '.state' | tr -d \")
washer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" $haUrl/api/states/sensor.washer_time_display | jq '.state' | tr -d \")

if [[ -z $washer ]]; then
	wash_img="󰜪 "
else
	wash_time=$(awk -F ':' '{print " 0"$1":"$2}' <<<"$washer")
	wash_img="󰜪 $wash_time "
fi

if [[ -z $dryer ]]; then
	dry_img="󰤗"
else
	dryer_time=$(awk -F ':' '{print " 0"$1":"$2}' <<<"$dryer")
	dry_img="󰤗 $dryer_time"
fi

echo "$wash_img $dry_img"
