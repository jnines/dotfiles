#!/usr/bin/env bash
_status=$(wpctl status)

_speakers=$(awk '
    /Sinks:/ { sink=1; next }
    /Sources:/ { sink=0 }
    sink && /Ryzen/ {
      gsub(/\.|\*|/,"")
      print $2
      exit
    }
  ' <<<"$_status")
#
_interface=$(awk '
    /Sinks:/ { sink=1; next }
    /Sources:/ { sink=0 }
    sink && /PCM2902/ {
      gsub(/\.|\*|/,"")
      print $2
      exit
    }
  ' <<<"$_status")

case "$1" in
check)
	wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -q Ryzen
	;;

speakers)
	wpctl set-default "$_speakers"
	;;

interface)
	wpctl set-default "$_interface"
	;;
esac
