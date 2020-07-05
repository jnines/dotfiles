#!/bin/bash

battery=$("$HOME"/.local/bin/git/headset/HeadsetControl/build/headsetcontrol -c -b)

    if [ "$battery" == "-1" ]; then
        echo "| iconName=audio-headset"
    else
        echo "${battery}% | bash='"$HOME"/bin/git/headset/HeadsetControl/build/headsetcontrol -l 0' onclick=bash"
    fi
