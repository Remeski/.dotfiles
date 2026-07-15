#!/bin/bash

if [ -n "$1" ]; then
	systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
	dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE
	systemctl --user start xdg-desktop-portal-wlr

	swaybg -m fill -i /home/rmz/Pictures/Bgs/blackhole.jpeg &
	hypridle &
	dunst &
else
	slstatus -s | dbus-run-session dwl -s './.local/scripts/start-dwl.sh startup'
fi
