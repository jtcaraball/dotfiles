#!/usr/bin/env bash

TARGET=$HOME/.config/hypr/hyprland-monitor.conf
MONITOR_NAME=$(hyprctl monitors | rg 'Monitor (.*) \(ID 0\)' -or '$1')
sed -i "s%monitor_name = .*%monitor_name = $MONITOR_NAME%g" $TARGET
