#!/bin/bash
#shellcheck disable=SC2086

state=$(cat /tmp/nv_mode 2>/dev/null)
if [[ -z "$state" ]] || [[ "$state" == "low" ]]; then
  color="#0087af"
  setting="high"
else
  color="#af0054"
  setting="low"
fi

gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
echo "${gpu_temp}°  | size=13 color=$color iconName=nvidia-gpu bash='nv_perf_mode $setting' onclick=bash"
