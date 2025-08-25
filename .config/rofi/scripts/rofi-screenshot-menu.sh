#!/usr/bin/env bash

set -e
set -u

# Options
options=(desktop area)
declare -A opt_texts
opt_texts[desktop]="Screenshot: Desktop"
opt_texts[area]="Screenshot: Area"

# notify and view screenshot
notify_view() {
	dunstify -u low --replace=699 "Screenshot Saved."
}

# Write formated message
write_message() {
    text="<span font_size=\"medium\">$1</span>"
	echo -n "$text"
}

# Show selection
print_selection() {
    echo -e "$1" | $(read -r -d '' entry; echo "echo $entry")
}

# Kill rofi
kill_rofi() {
	kill $(pgrep -af "rofi -show" | awk '{print $1}')
	sleep 0.2
}

# Don't allow custom entries
echo -e "\0no-custom\x1ftrue"
# Use markup
echo -e "\0markup-rows\x1ftrue"

# ==== Run ====

# Screenshot
time=`date +%Y-%m-%d-%H-%M-%S`
dir="$HOME/pictures/screenshots"
file="${dir}/screenshot_${time}.png"
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# Option messages
declare -A messages
for entry in "${options[@]}"; do
    messages[$entry]=$(write_message "${opt_texts[$entry]^}")
done

# Selection
if [ $# -gt 0 ]; then
	selection="${@}"
fi
if [ -z "${selection+x}" ]; then
    for entry in "${options[@]}"; do
        echo -e "${messages[$entry]}\0icon\x1fcamera\n"
    done
else
	case ${selection} in
		"$(print_selection "${messages[desktop]}")")
			kill_rofi
			grim -l 1 $file
			notify_view
			;;
		"$(print_selection "${messages[area]}")")
			kill_rofi
			slurp | grim -l 1 -g - $file
			notify_view
			;;
	esac
fi
