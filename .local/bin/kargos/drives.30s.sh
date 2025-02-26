#!/bin/bash

sensor_data=$(sensors)

nvme0=$(grep -oP 'SN850X.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme1=$(grep -oP 'SHPP41-2000GM.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme2=$(grep -oP 'Sabrent.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
ssd=$(awk '/drivetemp-scsi-0-0/,/^$/' <<<"$sensor_data" | grep 'temp1' | awk '{print $2}' | tr -d '+')

echo "<body>${nvme0%%.*}° ${nvme1%%.*}° ${nvme2%%.*}° ${ssd%%.*}° &nbsp;</body> | size=13 color=orange iconName=drive-harddisk-system"
