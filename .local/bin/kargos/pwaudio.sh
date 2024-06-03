#!/bin/bash

speakers=$(pactl list short sinks | awk '/pci/ && /analog-stereo/{print $1}')
aInterface=$(pactl list short sinks | awk '/Burr/{print $1}')
dSink=$(pactl info | grep "Default Sink")

if [[ "$dSink" =~ "Burr" ]]; then
	echo "| refresh=true iconName=preferences-desktop-sound size=14 bash='pactl set-default-sink $speakers' onclick=bash"
elif [[ "$dSink" =~ "pci" ]]; then
	echo "| refresh=true iconName=audio-speakers size=14 bash='pactl set-default-sink $aInterface' onclick=bash"
fi
