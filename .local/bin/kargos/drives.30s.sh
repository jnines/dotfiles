#!/bin/bash

sensor_data=$(sensors)

nvme0=$(grep -oP 'Composite.*?\+\K[0-9.]+' <<<"$sensor_data" | head -n 1)
nvme1=$(grep -oP 'Composite.*?\+\K[0-9.]+' <<<"$sensor_data" | tail -n 1)
ssd=$(awk '/drivetemp-scsi-2-0/,/^$/' <<<"$sensor_data" | grep 'temp1' | awk '{print $2}' | tr -d '+')

echo "<body>${nvme0%%.*}° ${nvme1%%.*}° ${ssd%%.*}° &nbsp;</body> | size=13 color=orange iconName=drive-harddisk-system"
