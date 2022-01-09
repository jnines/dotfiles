#!/bin/bash

if [[ -n $(pgrep quodlibet) ]]; then
    nplaying=$(/usr/bin/quodlibet --print-playing | sed 's/\.[^.]*$//')
    nPercent=$(/usr/bin/quodlibet --status | awk -F '.' '{print $NF}')
fi
    if [[ -n "$nplaying" ]]; then
        echo "<body>${nplaying}&nbsp;-&nbsp;${nPercent%?}%&nbsp;&nbsp;</body>|quodlibet size=13 color=grey bash='/usr/bin/quodlibet --show-window' onclick=bash"
    else
        echo "<body>&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=quodlibet bash='/usr/bin/quodlibet --start-playing' onclick=bash"

    fi
