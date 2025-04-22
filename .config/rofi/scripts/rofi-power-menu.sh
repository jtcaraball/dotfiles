#!/usr/bin/env bash

set -e
set -u

options=(restart poweroff logout)

declare -A texts
texts[restart]="restart"
texts[poweroff]="power off"
texts[logout]="logout"

function write_message {
    text="<span font_size=\"medium\">$1</span>"
	echo -n "$text"
}

function print_selection {
    echo -e "$1" | $(read -r -d '' entry; echo "echo $entry")
}

function confirm {
	cmd="$1"
	shift
	$HOME/.config/rofi/scripts/rofi-power-menu-confirm.sh "$cmd" "$*" &
}

declare -A messages
for entry in "${options[@]}"; do
    messages[$entry]=$(write_message "${texts[$entry]^}")
done

if [ $# -gt 0 ]; then
	selection="${@}"
fi

# Don't allow custom entries
echo -e "\0no-custom\x1ftrue"
# Use markup
echo -e "\0markup-rows\x1ftrue"

if [ -z "${selection+x}" ]; then
    for entry in "${options[@]}"; do
        echo -e "${messages[$entry]}"
    done
else
	case "$selection" in
		"$(print_selection "${messages[poweroff]}")")
			confirm "poweroff" "Power Off"
		;;
		"$(print_selection "${messages[restart]}")")
			confirm "reboot" "Restart"
		;;
		"$(print_selection "${messages[logout]}")")
			confirm "logout" "Logout"
		;;
		*)
			# The selection didn't match anything, so raise an error
			echo "Invalid selection: $selection" >&2
			exit 1
		;;
	esac
fi
