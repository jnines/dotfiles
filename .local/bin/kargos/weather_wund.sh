#!/bin/bash
source "$HOME"/.config/weather.rc

#IFS=$'\n'
mapfile -t wCur < <( curl -fs "https://api.weather.com/v2/pws/observations/current?stationId=KIADESMO91&format=json&units=e&apiKey=$api_key" |
jq '.observations[0].imperial.temp, .observations[0].imperial.heatIndex')

echo "${wCur[0]}°/${wCur[1]}° | size=15 refresh=true"
