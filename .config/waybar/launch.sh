#!/usr/bin/env bash

pid="$(pidof waybar)"

if [[ -n "$pid" ]]; then
	kill -9 $pid
	sleep 1
	exit 0
fi
waybar &
