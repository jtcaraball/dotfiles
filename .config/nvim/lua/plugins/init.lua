return {
	-- tpope is always first
	"tpope/vim-fugitive",

	"tpope/vim-commentary",

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require "configs.treesitter"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	 -- lsp stuff
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require "configs.mason"
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require "icons.devicons" }
		end,
	},


	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = {
					history = true,
					updateevents = "TextChanged,TextChangedI",
				},
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require "configs.luasnip"
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require "configs.cmp"
		end,
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		opts = function()
			return require("configs.nvim-lint").options
		end,
		config = function(_, opts)
			return require("configs.nvim-lint").setup(opts)
		end
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				go = { "gofumpt" },
				markdown = { "prettier" },
				yaml = { "prettier" },
			},
		},
	},

	-- file perusing
	"nvim-lua/plenary.nvim",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require "configs.telescope"
		end,
		config = function(_, opts)
			local telescope = require "telescope"
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},

	-- qol
	"unblevable/quick-scope",

	{
		'Wansmer/treesj',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesj').setup({})
		end,
	},

	{
		"kylechui/nvim-surround",
		config = function(_, opts)
			require("nvim-surround").setup(opts)
		end
	},

	-- theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = function()
			return require("configs.theme").options
		end,
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme "catppuccin"
		end
	},

	-- miscellaneous
	{
		"goolord/alpha-nvim",
		opts = function()
			return require "configs.alpha"
		end,
		config = function(_, opts)
			require("alpha").setup(opts)
		end
	},

	{

		'nvim-lualine/lualine.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'neovim/nvim-lspconfig',
		},
		opts = function()
			return require "configs.lualine"
		end,
		config = function (_, opts)
			require("lualine").setup(opts)
		end
	},

	-- latex
	{
		"lervag/vimtex",
		lazy = false,
		init = function ()
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_quickfix_open_on_warning = 0
			vim.g.vimtex_syntax_conceal_disable = 1
		end
	}
}
