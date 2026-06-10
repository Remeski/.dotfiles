#!/bin/bash

if [[ "$1" == "waybar" ]]; then
	pgrep wf-recorder > /dev/null
	if [ $? == 1 ]; then
		echo ""
	else
		echo stop
	fi
	exit
fi


pgrep wf-recorder
if [ $? == 1 ]; then
	AREA=$(slurp)
	if [ -z "$AREA" ]; then
		exit
	fi
	wf-recorder --file /tmp/screen-record.mp4 -g "$AREA" -y && notify-send "Saved file to /tmp/screen-record.mp4" &
else
	pkill wf-recorder
fi

pkill -RTMIN+10 waybar
