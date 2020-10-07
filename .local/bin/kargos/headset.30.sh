#!/bin/bash

battery=$("$HOME"/.local/bin/git/headset/HeadsetControl/build/headsetcontrol -c -b)

    if [ "$battery" == "-1" ] || [ "$battery" == "-2" ]; then
        echo "| iconName=audio-headset"
    elif [[ "$battery" =~ [0-9] ]]; then
        echo "${battery}% | bash='$HOME/.local/bin/git/headset/HeadsetControl/build/headsetcontrol -l 0' onclick=bash"
    else
        echo "🔥 | size=18"
    fi
