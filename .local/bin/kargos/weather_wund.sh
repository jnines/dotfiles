#!/bin/bash
source "$HOME"/.config/weather.rc

mapfile -t wCur < <( curl -fs "https://api.weather.com/v2/pws/observations/current?stationId=$station&format=json&units=e&apiKey=$api_key" |
jq '.observations[0].imperial.temp, .observations[0].imperial.heatIndex, .observations[0].imperial.windChill')

if ((wCur[0] >= 60)); then
    echo "${wCur[0]}°/${wCur[1]}° | size=15 refresh=true"
else
    echo "${wCur[0]}°/${wCur[2]}° | size=15 refresh=true"
fi
