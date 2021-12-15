#!/bin/bash

if [[ -n $(pgrep quodlibet) ]]; then
    nplaying=$(/usr/bin/quodlibet --print-playing | sed 's/\.[^.]*$//')
fi
    if [[ -n "$nplaying" ]]; then
        echo "<body>${nplaying}&nbsp;&nbsp;&nbsp;&nbsp;</body>|quodlibet size=13 color=grey bash='/usr/bin/quodlibet --show-window' onclick=bash"
    else
        echo "<body>&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=quodlibet bash='/usr/bin/quodlibet --start-hidden --start-playing' onclick=bash"

    fi
