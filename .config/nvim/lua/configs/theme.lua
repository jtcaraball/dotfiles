local M = {}

M.colors = require("catppuccin.palettes").get_palette()

M.colors.none = "NONE"

local border_color = M.colors.lavender

M.options = {
	term_colors = true,
	flavour = 'mocha',
	transparent_background = true,
	custom_highlights = {
		FloatBorder = { fg = border_color },
		TelescopeBorder = { fg = border_color },
		Comment = { fg = M.colors.overlay1 },
		LineNr = { fg = M.colors.overlay1 },
		CursorLine = { bg = M.colors.none },
		CursorLineNr = { fg = M.colors.lavender },
		DiagnosticVirtualTextError = { bg = M.colors.none },
		DiagnosticVirtualTextWarn = { bg = M.colors.none },
		DiagnosticVirtualTextInfo = { bg = M.colors.none },
		DiagnosticVirtualTextHint = { bg = M.colors.none },
		CmpSel = { link = "PmenuSel", bold = true },
		CmpDoc = { bg = M.colors.success },
		CatFooter = { fg = M.colors.surface2 },
		TelescopeSelection = { fg = M.colors.text },
		LuaLineDiffAdd = { fg = M.colors.overlay1 },
		LuaLineDiffChange = { fg = M.colors.overlay1 },
		LuaLineDiffDelete = { fg = M.colors.overlay1 },
	},
	integrations = {
		aerial = true,
		alpha = true,
		cmp = true,
		dashboard = true,
		flash = true,
		grug_far = true,
		gitsigns = true,
		headlines = true,
		illuminate = true,
		indent_blankline = { enabled = true },
		leap = true,
		lsp_trouble = true,
		mason = true,
		markdown = true,
		mini = true,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
		navic = { enabled = true, custom_bg = "lualine" },
		neotest = true,
		neotree = true,
		noice = true,
		notify = true,
		semantic_tokens = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
		which_key = true,
	},
}

return M
