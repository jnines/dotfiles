#!/bin/bash

_check() {
	mic=$(amixer get Capture | awk 'END{gsub(/\[|\]/,""); print $NF}')
	if [[ "$mic" == on ]]; then
		return 0
	else
		return 1
	fi
}

_off() {
	amixer set Capture nocap
}

_on() {
	amixer set Capture cap
}

case $1 in
check)
	_check
	;;
on)
	_on
	;;
off)
	_off
	;;
*)
	exit
	;;
esac
