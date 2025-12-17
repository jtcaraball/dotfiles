return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		local colors = require("catppuccin.palettes").get_palette()
		colors.none = "NONE"
		local border_color = colors.lavender
		local options = {
			term_colors = true,
			flavour = 'mocha',
			transparent_background = true,
			custom_highlights = {
				ColorColumn = { bg = colors.surface3 },
				NormalFloat = { bg = colors.none },
				FloatTitle = { bg = colors.none },
				FloatBorder = { fg = border_color, bg = colors.none },
				Comment = { fg = colors.overlay1 },
				LineNr = { fg = colors.overlay1 },
				CursorLine = { bg = colors.none },
				CursorLineNr = { fg = colors.lavender },
				DiagnosticVirtualTextError = { bg = colors.none },
				DiagnosticVirtualTextWarn = { bg = colors.none },
				DiagnosticVirtualTextInfo = { bg = colors.none },
				DiagnosticVirtualTextHint = { bg = colors.none },
				BlinkCmpMenuBorder = { fg = border_color },
				BlinkCmpSignatureHelpBorder = { fg = border_color },
				TelescopeBorder = { fg = border_color },
				TelescopeSelection = { fg = colors.text },
				LuaLineDiffAdd = { fg = colors.overlay1 },
				LuaLineDiffChange = { fg = colors.overlay1 },
				LuaLineDiffDelete = { fg = colors.overlay1 },
			},
			integrations = {
				aerial = true,
				blink_cmp = true,
				cmp = true,
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
		require("catppuccin").setup(options)
		vim.cmd.colorscheme "catppuccin"
	end
}
