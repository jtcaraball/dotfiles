return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			go = { 'gofumpt' },
			markdown = { 'prettier' },
			yaml = { 'prettier' },
			vue = { 'prettier' },
			typescript = { 'prettier' },
			typescriptreact = { 'prettier' },
			python = { 'autopep8' },
			sql = { 'pg_format' },
			typst = { 'typstyle' }
		},
	},
}
