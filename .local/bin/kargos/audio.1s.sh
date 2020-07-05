#!/bin/bash

sink=$(pactl list short sinks | awk '/pci/{print $1}')
spm=$(pactl list sinks | grep '^[[:space:]]Mute:' | head -n $(( sink + 1 )) | tail -n 1 | awk '{gsub("Mute:","");gsub(/^[ \t]+|[ \t]+$/, ""); print}')

    if [ "$spm" == yes ]; then
        sp="|iconName=audio-off bash='pactl set-sink-mute ${sink} 0' onclick=bash"
    else
        sp="|iconName=audio-on bash='pactl set-sink-mute ${sink} 1' onclick=bash"
    fi
    
echo "${sp}"
