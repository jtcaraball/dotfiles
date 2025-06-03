-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy").setup(
	{ import = "plugins" },
	{
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
)

