#!/bin/bash

speakers=$(pactl list short sinks | awk '/pci/{print $1}')
aInterface=$(pactl list short sinks | awk '/Burr/{print $1}')
dSink=$(pactl info | grep "alsa_output.pci")
aIicon="| iconName=preferences-desktop-sound"


    if [ -z "$dSink" ]; then
        sp="$aIicon bash='pactl set-default-sink $speakers' onclick=bash"
    else
        sp="|iconName=audio-speakers size=14 bash='pactl set-default-sink $aInterface' onclick=bash"
    fi

echo "${sp}"