return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { 'gofumpt' },
			markdown = { 'prettier' },
			yaml = { 'prettier' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			python = { 'autopep8' },
			sql = { 'pg_format' },
			typst = { 'typstyle' }
		},
	},
	keys = {
		{
			'<leader>fm',
			function()
				require('conform').format { lsp_fallback = true }
			end,
			mode = 'n',
			desc = 'format file with conform',
		}
	},
}
