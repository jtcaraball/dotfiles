return {
	defaults = { lazy = false },
	install = { colorscheme = { "catppuccin" } },

	ui = {
		icons = {
			ft = "",
			lazy = "󰂠 ",
			loaded = "",
			not_loaded = "",
		},
		border = "rounded",
	},

	performance = {
		rtp = {
			disabled_plugins = {
				"2html_plugin",
				"tohtml",
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"tar",
				"tarPlugin",
				"rrhelper",
				"vimball",
				"vimballPlugin",
				"zip",
				"zipPlugin",
				"tutor",
				"rplugin",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
				"syntax",
				-----------------
				-- "netrw",
				-- "netrwPlugin",
				-- "netrwSettings",
				-- "netrwFileHandlers",
				-- "spellfile_plugin",
				-- "ftplugin",
			},
		},
	},
}
