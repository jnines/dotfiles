#!/bin/bash

speakers=$(pactl list short sinks | awk '/pci/{print $1}')
headset=$(pactl list short sinks | awk '/usb/{print $1}')
dSink=$(pactl info | grep "alsa_output.pci")
battery=$("$HOME"/.local/bin/git/headset/HeadsetControl/build/headsetcontrol -c -b)

    if [ "$battery" == "-1" ] || [ "$battery" == "-2" ]; then
        hdset="| iconName=audio-headset"
    elif [[ "$battery" =~ [0-9] ]]; then
        hdset="${battery}% | bash='$HOME/.local/bin/git/headset/HeadsetControl/build/headsetcontrol -l 0' onclick=bash"
    fi


# spm=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( sink + 1 )) | tail -n 1 | awk '{gsub("Mute:","");gsub(/^[ \t]+|[ \t]+$/, ""); print}')

    if [ -z "$dSink" ]; then
        sp="$hdset bash='pactl set-default-sink $speakers' onclick=bash"
    else
        sp="|iconName=audio-on size=14 bash='pactl set-default-sink $headset' onclick=bash"
    fi

echo "${sp}"