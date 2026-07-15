#!/bin/bash

if [ -n "$1" ]; then
	swaybg -m fill -i /home/rmz/Pictures/Bgs/blackhole.jpeg &
	hypridle &
	dunst &
else
	slstatus -s | dwl -s './.local/scripts/start-dwl.sh startup'
fi
