#!/bin/bash

mic=$(amixer get Capture | awk 'END{gsub(/\[|\]/,""); print $NF}')
    if [[ "$mic" == on ]]; then
        echo "<body>&nbsp;&nbsp;&nbsp;</body>|iconName=mic-on bash='amixer set Capture nocap' onclick=bash"
    else
        echo "<body>&nbsp;&nbsp;&nbsp;</body>|iconName=mic-off bash='amixer set Capture cap' onclick=bash"
    fi
