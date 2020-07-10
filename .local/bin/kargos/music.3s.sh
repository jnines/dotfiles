#!/bin/bash

nplaying=$(/usr/bin/quodlibet --print-playing | sed 's/\.[^.]*$//')

    if [[ -n "$nplaying" ]]; then
        echo "<body>${nplaying}&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=audio-player size=13 color=grey bash='/usr/bin/quodlibet --show-window' onclick=bash"
    else
        echo "<body>&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=audio-player bash='/usr/bin/quodlibet --start-hidden --start-playing' onclick=bash"

    fi
