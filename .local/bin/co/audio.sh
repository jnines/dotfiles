#!/bin/bash

speakers=$(pactl list short sinks | awk '/pci/ && /analog-stereo/{print $1}')
aInterface=$(pactl list short sinks | awk '/Burr/{print $1}')
dSink=$(pactl info | grep "Default Sink")

_speakers() {
	pactl set-default-sink "$speakers"
}
_interface() {
	pactl set-default-sink "$aInterface"
}
_check() {
	if [[ "$dSink" =~ "pci" ]]; then
		return 0
	elif [[ "$dSink" =~ "Burr" ]]; then
		return 1
	else
		exit
	fi
}

case $1 in
check)
	_check
	;;
speakers)
	_speakers
	;;
interface)
	_interface
	;;
*)
	exit
	;;
esac
