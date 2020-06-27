#!/usr/bin/env bash

gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo "${gpu_temp}° | color=green bash='/usr/bin/ksysguard' onclick=bash"