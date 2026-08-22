local colors = require('theme/catppuccin')

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
	misc = {
		disable_hyprland_logo = true,
	},
	-- Everything should be next to eachother.
	general = {
		gaps_in = 0,
		gaps_out = 0,
		border_size = 0,
		col = {
			active_border = {
				colors = { colors.blue, colors.mauve },
				angle = 25,
			},
			inactive_border = colors.base,
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = 'dwindle'
	},
	-- Lets make our layout nicer.
	dwindle = {
		preserve_split = true,
	},
	-- Honestly, I don't even remember why this is here.
	decoration = {
		rounding = 0,
		rounding_power = 0,
		active_opacity = 1.0,
		inactive_opacity = 0.8,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = 'rgba(1a1a1aee)',
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},
})
