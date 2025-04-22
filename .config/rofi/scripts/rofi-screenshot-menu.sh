#!/usr/bin/env bash

set -e
set -u

echo -e "\0no-custom\x1ftrue"

if [ x"$@" = x"Screenshot" ]; then
	$HOME/.config/rofi/scripts/rofi-screenshot-menu-options.sh &
fi

echo -e "Screenshot"
