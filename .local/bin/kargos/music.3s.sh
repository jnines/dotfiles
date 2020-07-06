#!/bin/bash

nplaying=$(/usr/bin/quodlibet --print-playing | sed 's/\.[^.]*$//')

    if [[ -n "$nplaying" ]]; then
        echo "<body>${nplaying}&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=music color=brown bash='/usr/bin/quodlibet --show-window' onclick=bash"
    else
        echo "<body>&nbsp;&nbsp;&nbsp;&nbsp;</body>|iconName=music bash='/usr/bin/quodlibet --start-hidden --start-playing' onclick=bash"

    fi
