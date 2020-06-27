#!/usr/bin/env bash

mic=$(amixer get Capture | awk -F [ '/]/{gsub(/ /,"",$0);gsub("]","",$0); print $3 }')

    if [[ "$mic" == on ]]; then
        echo "|iconName=mic-on bash='amixer set Capture nocap' onclick=bash"
    else
        echo "|iconName=mic-off bash='amixer set Capture cap' onclick=bash"
    fi
