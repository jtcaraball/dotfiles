--- @nodoc
--- @param buf_id integer
--- @param client vim.lsp.Client
--- @return boolean
local function buf_in_client(buf_id, client)
	for id, _ in pairs(client.attached_buffers) do
		if buf_id == id then
			return true
		end
	end
	return false
end

--- @nodoc
--- @return string
local function clients_lsp()
	local clients = vim.lsp.get_clients()
	local curr_buf = vim.api.nvim_get_current_buf()
	if next(clients) == nil then
		return ""
	end

	local c = {}
	for _, client in pairs(clients) do
		if buf_in_client(curr_buf, client) then
			table.insert(c, client.name)
		end
	end

	local out = table.concat(c, "|")
	return (vim.o.columns > 100 and "   LSP ~ " .. out .. " ") or "   LSP "
end

local function mode_theme(colors, mode_color)
	return {
		a = { bg = mode_color, fg = colors.mantle, gui = "bold" },
		b = { bg = colors.surface1, fg = colors.subtext0 },
		c = { bg = colors.none, fg = colors.overlay1 },
		x = { bg = colors.none },
		y = { bg = colors.none, fg = colors.subtext0 },
		z = { bg = colors.surface1, fg = colors.subtext0 },
	}
end

return {
	'nvim-lualine/lualine.nvim',
	commit = '47f91c4',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	config = function ()
		local colors = require("catppuccin.palettes").get_palette()
		colors.none = "NONE"
		local theme = {
			normal = mode_theme(colors, colors.blue),
			insert = mode_theme(colors, colors.green),
			terminal = mode_theme(colors, colors.green),
			command = mode_theme(colors, colors.peach),
			visual = mode_theme(colors, colors.mauve),
			replace = mode_theme(colors, colors.red),
			inactive = mode_theme(colors, colors.blue),
		}
		local options = {
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
		require("lualine").setup(options)
	end
}
