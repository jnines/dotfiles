#!/bin/bash

speakers=$(pactl list short sinks | awk '/pci/{print $1}')
aInterface=$(pactl list short sinks | awk '/Burr/{print $1}')
bT=$(pactl list short sinks | awk '/bluez/{print $1}')
dSink=$(pactl info | grep "Default Sink")

if [ -z "$bT" ]; then

    if [[ "$dSink" =~ "Burr" ]]; then
        sp="| refresh=true iconName=preferences-desktop-sound size=14 bash='pactl set-default-sink $speakers' onclick=bash"
    elif [[ "$dSink" =~ "pci" ]]; then
        sp="| refresh=true iconName=audio-speakers size=14 bash='pactl set-default-sink $aInterface' onclick=bash"
    fi
else
    if [[ "$dSink" =~ "Burr" ]]; then
        sp="| refresh=true iconName=preferences-desktop-sound size=14 bash='pactl set-default-sink $speakers' onclick=bash"
    elif [[ "$dSink" =~ "pci" ]]; then
        sp="| refresh=true iconName=audio-speakers size=14 bash='pactl set-default-sink $bT' onclick=bash"
    elif [[ "$dSink" =~ "bluez" ]]; then
        sp="| refresh=true iconName=bluetooth size=14 bash='pactl set-default-sink $aInterface' onclick=bash"
    fi
fi
echo "${sp}"
