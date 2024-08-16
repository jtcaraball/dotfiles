vim.cmd([[
	hi StartLogo1 guifg=#143F6B
	hi StartLogo2 guifg=#344268
	hi StartLogo3 guifg=#544564
	hi StartLogo4 guifg=#744861
	hi StartLogo5 guifg=#954A5D
	hi StartLogo6 guifg=#B54D5A
	hi StartLogo7 guifg=#D55056
	hi StartLogo8 guifg=#F55353
]])

-- Set header
local header = {
	[[                                                                   ]],
	[[      ████ ██████           █████      ██                    ]],
	[[     ███████████             █████                            ]],
	[[     █████████ ███████████████████ ███   ███████████  ]],
	[[    █████████  ███    █████████████ █████ ██████████████  ]],
	[[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
	[[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
	[[██████  █████████████████████ ████ █████ █████ ████ ██████]],
}

-- Colorize header
local function colorize_header()
	local lines = {}
	for i, chars in pairs(header) do
		local line = {
			type = "text",
			val = chars,
			opts = {
				hl = "StartLogo" .. i,
				shrink_margin = false,
				position = "center",
			}
		}
		table.insert(lines, line)
	end
	local output = {
		type = "group",
		val = lines,
		opts = { position = "center" }
	}
	return output
end

local version = vim.version()

local options = {
	layout = {
		{ type = "padding", val = 10 },
		colorize_header(),
		{ type = "padding", val = 6 },
		{
			type = "text",
			val = "- v" .. version.major .. "." .. version.minor .. "." .. version.patch .. " -",
			opts = { position = "center", hl = "CatFooter" },
		},
	},
	opts = {
		margin = 5,
		keymap = {
			press = nil,
		},
	},
}

return options
