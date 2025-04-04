#!/usr/bin/env bash

kill $(pgrep -af "rofi -show" | awk '{print $1}')
sleep 0.2

cmd=$1
shift

menu_style="#prompt{enabled: true;} listview{require-input: false;}"
chosen=$(printf "Yes, $*\nCancel" | rofi -dmenu -i -p "Confirm $*:" -theme-str "$menu_style")

case "$chosen" in
	"Yes, $*")
		shift
		systemctl $cmd
		exit 0
	;;
	"Cancel")
		exit 0
	;;
esac
