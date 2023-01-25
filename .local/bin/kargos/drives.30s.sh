#!/bin/bash

nvme0=$(sensors | grep -oP 'Composite.*?\+\K[0-9.]+' | head -n 1)
nvme1=$(sensors | grep -oP 'Composite.*?\+\K[0-9.]+' | tail -n 1)
hdd=$(sudo hddtemp /dev/sdb | awk '{print $3}' | cut -c -2)

echo "<body>${nvme0%%.*}° ${nvme1%%.*}° ${hdd%%.*}° &nbsp;</body> | size=13 color=orange iconName=drive-harddisk-system"
