#!/bin/bash
#shellcheck disable=SC2086

gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo "${gpu_temp}°  | size=13 color=green iconName=nvidia-gpu bash='sudo nvidia-settings --config="$HOME/.config/nvidia/settings/.nvidia-settings-rc"' onclick=bash"
echo "---"

echo "High Performance | refresh=true iconName=temperature-warm size=14 bash='sudo nvidia-smi -rgc && sudo nvidia-smi -rmc' onclick=bash"
echo "Low Performance | refresh=true iconName=temperature-cold size=14 bash='sudo nvidia-smi -lgc 210,600 && sudo nvidia-smi -lmc 405,810' onclick=bash"
