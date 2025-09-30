#!/usr/bin/env bash

set -euo  pipefail

TERM="kitty"
TMPFILE="/tmp/nvim-input-tmp"

copy_content() {
	hyprctl dispatch sendshortcut "CTRL,A,"
	hyprctl dispatch sendshortcut "CTRL,C,"
	hyprctl dispatch sendshortcut "CTRL SHIFT,HOME,"
}

paste_content() {
	hyprctl dispatch sendshortcut "CTRL,A,"
	hyprctl dispatch sendshortcut ",DELETE,"
	hyprctl dispatch sendshortcut "CTRL,V,"
}

# Copy
CLIPBOARD=$(wl-paste -n)
sleep 0.5  # Wait for dispatched commands to their thing
copy_content
INPUT=$(wl-paste -n)

# Ask for extension
ROFI_STYLE="#prompt{enabled: true;} #listview{enabled: false;}"
EXTENSION=$(echo "" | rofi -dmenu -p "Extension" -theme-str "${ROFI_STYLE}")
TMPFILE="${TMPFILE}.${EXTENSION}"

# Edit
wl-paste --type TEXT >"${TMPFILE}"
$TERM nvim +startinsert +'autocmd BufWritePost <buffer> quit' "${TMPFILE}" || true

# Paste
cat "${TMPFILE}" | wl-copy -n
paste_content

# Restore
sleep 0.5  # Wait for dispatched commands to their thing
echo "${CLIPBOARD}" | wl-copy -n
rm "${TMPFILE}"
