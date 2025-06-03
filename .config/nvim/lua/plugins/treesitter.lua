local ignore_array = {
	"latex"
}

local options = {
	ensure_installed = {
		"lua",
		"luadoc",
		"printf",
		"vim",
		"vimdoc",
		"c",
		"go",
		"comment",
		"javascript",
		"typescript",
	},

	highlight = {
		enable = true,
		disable = ignore_array,
		use_languagetree = true,
	},

	auto_install = true,

	ignore_install = ignore_array,

	indent = {
		enable = true,
		disable = ignore_array,
	},

	incremental_selection = {
		disable = ignore_array,
	}
}

return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup(options)
	end,
}
