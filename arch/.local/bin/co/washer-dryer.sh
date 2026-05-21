#!/bin/bash
# shellcheck disable=SC1091,SC2154,SC2323
source "$HOME"/.config/ha.rc

dryer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$haUrl"/api/states/sensor.dryer_remaining_time_2 | jq '.state' | tr -d \")
washer=$(/usr/bin/curl -s -X GET -H "Authorization: Bearer $token" -H "Content-Type: application/json" "$haUrl"/api/states/sensor.washer_remaining_time_2 | jq '.state' | tr -d \")

if [[ -z $washer ]] || [[ $washer == u* ]]; then
	wash_img="󰜪 "
else
	wash_secs=$((($(date -d "$washer" +%s) - $(date +%s))))
	wash_time=$(date -u -d "@$wash_secs" +%H:%M)
	wash_img="󰜪 $wash_time "
fi

if [[ -z $dryer ]] || [[ $dryer == u* ]]; then
	dry_img="󰤗"
else
	dryer_secs=$((($(date -d "$dryer" +%s) - $(date +%s))))
	dryer_time=$(date -u -d "@$dryer_secs" +%H:%M)
	dry_img="󰤗 $dryer_time"
fi

echo "$wash_img $dry_img"
