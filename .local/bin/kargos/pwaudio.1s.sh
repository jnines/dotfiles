#!/bin/bash

bIcon=$(pactl info | grep "Default Sink")
case "$bIcon" in
    *"pci"*) aIcon="audio-speakers" ;;
    *"Burr"*) aIcon="preferences-desktop-sound" ;;
    *"bluez"*) aIcon="bluetooth" ;;
esac
echo "| size=14 iconName=$aIcon"
echo "---"
speakers=$(pactl list short sinks | awk '/pci/{print $1}')
aInterface=$(pactl list short sinks | awk '/Burr/{print $1}')
bT=$(pactl list short sinks | awk '/bluez/{print $1}')
mapfile fSinks < <(pactl list short sinks)

for i in "${fSinks[@]}"
do
    case $i in
        exit) break ;;
        *"pci"*) echo "Speakers | iconName=audio-speakers bash='/usr/bin/pactl set-default-sink $speakers' onlclick=bash" ;;
        *"Burr"*) echo "Interface | iconName=preferences-desktop-sound bash='/usr/bin/pactl set-default-sink $aInterface' onclick=bash" ;;
        *"bluez"*) echo "Bluetooth | iconName=bluetooth bash='/usr/bin/pactl set-default-sink $bT' onclick=bash" ;;
        *) echo "Unknown" ;;
    esac
done
