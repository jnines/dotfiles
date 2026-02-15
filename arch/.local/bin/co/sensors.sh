#!/bin/bash
red="\e[38;5;198m"
brown="\e[38;5;136m"
reset="\e[0m"
sensor_data=$(/usr/bin/sensors)

cpu=$(grep -oP 'Tctl.*?\+\K[0-9.]+' <<<"${sensor_data}" | head -n 1)
gpu=$(grep -oP 'junction.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme0=$(grep -oP 'SN850X.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme1=$(grep -oP 'SHPP41-2000GM.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme2=$(grep -oP 'Sabrent.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)

echo -en "$red${cpu%%.*}° $red${gpu%%.*}° $brown${nvme0%%.*}° ${nvme1%%.*}° ${nvme2%%.*}°$reset"
