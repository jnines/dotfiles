#!/bin/bash

mic=$(amixer get Capture | awk '/\[/{gsub(/\[|\]/,"");print $5}')
    if [[ "$mic" == on ]]; then
        echo "|iconName=mic-on bash='amixer set Capture nocap' onclick=bash"
    else
        echo "|iconName=mic-off bash='amixer set Capture cap' onclick=bash"
    fi
