#!/usr/bin/env bash

set -euo  pipefail

TERM="kitty"
TMPFILE="/tmp/nvim-input-tmp"

# Ask for extension
ROFI_STYLE="#prompt{enabled: true;} #listview{enabled: false;}"
EXTENSION=$(echo "" | rofi -dmenu -p "Extension" -theme-str "${ROFI_STYLE}")
TMPFILE="${TMPFILE}.${EXTENSION}"

# Input
$TERM nvim +startinsert +'autocmd BufWritePost <buffer> quit' "${TMPFILE}" || true

# Move to clipboard if not empty
CONTENT=$(cat "${TMPFILE}")
if [[ ! -z "${CONTENT}" ]]; then
	wl-copy -n "${CONTENT}"
fi

# Clean up
rm "${TMPFILE}"
