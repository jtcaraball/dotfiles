-- MONITOR(S) --

hl.monitor({
	output = 'DP-4',
	mode = '2560x1440@143.97Hz',
	position = '0x0',
	scale = 'auto',
})
hl.monitor({
	output = 'HDMI-A-2',
	mode = '1920x1080@59.94Hz',
	position = '2560x0',
	scale = 'auto',
})

-- THEME --

require('theme/windows')
require('theme/animations')

-- PROGRAMS --

local terminal = 'kitty'
local menu = 'rofi -show combi'
local bar = '~/.config/waybar/launch.sh'

-- AUTOSTART --

hl.on('hyprland.start', function()
	hl.exec_cmd('hyprpaper')
	hl.exec_cmd('hypridle')
end)

-- INPUT --

hl.config({
	input = {
		kb_layout = 'us, us',
		kb_variant = ', alt-intl',
		kb_model = '',
		kb_options = 'grp:alt_shift_toggle',
		kb_rules = '',
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
	},
})

-- KEYBINDS --

local mainMod = 'SUPER'

-- Custom keybinds.
hl.bind(mainMod .. ' + I', hl.dsp.exec_cmd(bar))
hl.bind(mainMod .. ' + Space', hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. ' + Return', hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. ' + A', hl.dsp.dpms())
-- Navigation keybinds.
hl.bind(mainMod .. ' + left', hl.dsp.focus({ direction = 'left' }))
hl.bind(mainMod .. ' + right', hl.dsp.focus({ direction = 'right' }))
hl.bind(mainMod .. ' + up', hl.dsp.focus({ direction = 'up' }))
hl.bind(mainMod .. ' + down', hl.dsp.focus({ direction = 'down' }))
-- Window management keybinds.
hl.bind(mainMod .. ' + SHIFT + left', hl.dsp.window.move({ direction = 'left' }))
hl.bind(mainMod .. ' + SHIFT + right', hl.dsp.window.move({ direction = 'right' }))
hl.bind(mainMod .. ' + SHIFT + up', hl.dsp.window.move({ direction = 'up' }))
hl.bind(mainMod .. ' + SHIFT + down', hl.dsp.window.move({ direction = 'down' }))
-- We have forloops now.
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i }))
end
-- Volume keybinds.
hl.bind(
	'XF86AudioRaiseVolume',
	hl.dsp.exec_cmd('wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+'),
	{ repeating = true, locked = true }
)
hl.bind(
	'XF86AudioLowerVolume',
	hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'),
	{ repeating = true, locked = true }
)
hl.bind(
	'XF86AudioMute',
	hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle'),
	{ locked = true }
)

-- WINDOWRULES --

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name           = 'suppress-maximize-events',
	match          = { class = '.*' },
	suppress_event = 'maximize',
})
hl.window_rule({
	-- Fix some dragging issues with XWayland
	name     = 'fix-xwayland-drags',
	match    = {
		class      = '^$',
		title      = '^$',
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},
	no_focus = true,
})
hl.window_rule({
	name  = 'move-hyprland-run',
	match = { class = 'hyprland-run' },
	move  = '20 monitor_h-120',
	float = true,
})
