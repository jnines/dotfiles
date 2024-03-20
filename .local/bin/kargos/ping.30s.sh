#!/bin/bash

echo "$(ping -c 4 1.1.1.1 | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | xargs printf "%4.fms") | size=13 color='white'"
