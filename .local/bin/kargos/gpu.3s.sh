#!/bin/bash

gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo "${gpu_temp}°  | size=13 color=green iconName=nvidia-gpu bash='sudo nvidia-settings --config="$HOME/.config/nvidia/settings/.nvidia-settings-rc"' onclick=bash"
