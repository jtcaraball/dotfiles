#!/usr/bin/env bash

WPPATH=$1
CONF=$HOME/.config/hypr/hyprpaper.conf

# Current session changes
hyprctl hyprpaper wallpaper ",$WPPATH"

# Change config
sed -i "s%WPP = .*%WPP = $WPPATH%g" $CONF
