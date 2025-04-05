#!/usr/bin/env bash

kill $(pgrep -af "rofi -show" | awk '{print $1}')
sleep 0.2

cmd=$1
shift

menu_style="#prompt{enabled: true;} listview{require-input: false;}"
chosen=$(printf "Yes, $*\nCancel" | rofi -dmenu -i -p "Confirm $*:" -theme-str "$menu_style")

handle_cmd () {
	if [ "$cmd" = "logout" ]; then
		i3-msg exit
		return
	fi
	systemctl $cmd
}

case "$chosen" in
	"Yes, $*")
		handle_cmd
		exit 0
	;;
	"Cancel")
		exit 0
	;;
esac
