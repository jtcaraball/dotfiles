-- custom sections

local function clients_lsp()
	local clients = vim.lsp.get_clients()
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		table.insert(c, client.name)
	end

	local out = table.concat(c, "|")
	return (vim.o.columns > 100 and "   LSP ~ " .. out .. " ") or "   LSP "
end

-- theme

local colors = require("configs.theme").colors

local function mode_theme(mode_color)
	return {
		a = { bg = mode_color, fg = colors.mantle, gui = "bold" },
		b = { bg = colors.surface1, fg = colors.subtext0 },
		c = { bg = colors.none, fg = colors.overlay1 },
		x = { bg = colors.none },
		y = { bg = colors.none, fg = colors.subtext0 },
		z = { bg = colors.surface1, fg = colors.subtext0 },
	}
end

local theme = {
	normal = mode_theme(colors.blue),
	insert = mode_theme(colors.green),
	terminal = mode_theme(colors.green),
	command = mode_theme(colors.peach),
	visual = mode_theme(colors.mauve),
	replace = mode_theme(colors.red),
	inactive = mode_theme(colors.blue),
}

-- config

local opts = {
	options = {
		icons_enabled = true,
		theme = theme,
		globalstatus = true,
		component_separators = { left = "", right = ""},
		section_separators = {left = " ", right = " "},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				icon = "",
				separator = { right = "" },
			},
		},
		lualine_b = {
			{
				"",
				padding = 0,
				draw_empty = true,
				color = { bg = colors.surface2 },
				separator = { right = "" },
			},
			{
				"filetype",
				icon_only = true,
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				path = 4,
				padding = { left = 0, right = 1 },
				separator = { right = "" },
			},
		},
		lualine_c = {
			{ "branch", icon = ""},
			{
				"diff",
				symbols = {
					added = "+",
					modified = "~",
					removed = "-",
				},
				padding = { left = 0 },
			},
		},
		lualine_x = {
			{
				"diagnostics",
				symbols = {
					error = " ",
					warn = " ",
					hint = "󰛩 ",
					info = "󰋼 ",
				},
				padding = { right = 0 },
			},
		},
		lualine_y = { clients_lsp },
		lualine_z = { { "location", separator = { left = ""} } }
	},
	tabline = {},
	extensions = {}
}

return opts
