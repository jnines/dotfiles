#!/bin/bash
source "$HOME"/.config/weather.rc
wfile="$HOME"/.local/share/weather_owm
curl -fs "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,hourly&units=imperial&APPID=$appid" | jq '.' > "$wfile"
trim=('.*' '"' '"')
IFS=$'\n'
mapfile -t wtrd < <( jq '.current.weather[0].icon, .current.temp, .current.feels_like, .daily[0].temp.max, .daily[0].temp.min' "$wfile" )
wtrd[3]="🔺${wtrd[3]}"
wtrd[4]="🔻${wtrd[4]}"
for tr in "${trim[@]}"
do
    wtrd=("${wtrd[@]/$tr}")
done
case ${wtrd[0]} in
    01*) cur="🌞" ;;
    02*) cur="🌤" ;;
    03*) cur="☁" ;;
    04*) cur="☁" ;;
    09*) cur="🌧" ;;
    10*) cur="🌧" ;;
    11*) cur="⛈" ;;
    13*) cur="🌨" ;;
    50*) cur="🌫" ;;
      *) cur="❗" ;;
    esac

echo "${cur} ${wtrd[1]}°/${wtrd[2]}° ${wtrd[3]}°${wtrd[4]}° | size=15 refresh=true"

unset IFS
