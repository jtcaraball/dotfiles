local options = {
	defaults = {
		prompt_prefix = " 	",
		selection_caret = " ",
		entry_prefix = " ",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			width = 0.87,
			height = 0.80,
		},
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
	extensions_list = {},
	extensions = {},
}

return {
	"nvim-lua/plenary.nvim",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		config = function()
			local telescope = require "telescope"
			telescope.setup(options)
			for _, ext in ipairs(options.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
}
