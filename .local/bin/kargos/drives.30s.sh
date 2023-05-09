#!/bin/bash

nvme0=$(sensors | grep -oP 'Composite.*?\+\K[0-9.]+' | head -n 1)
nvme1=$(sensors | grep -oP 'Composite.*?\+\K[0-9.]+' | tail -n 1)
hdd=$(nc localhost 7634 | awk -F '|' '{print $4}')

echo "<body>${nvme0%%.*}° ${nvme1%%.*}° ${hdd%%.*}° &nbsp;</body> | size=13 color=orange iconName=drive-harddisk-system"
