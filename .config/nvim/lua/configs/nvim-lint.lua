local M = {}

M.options = {
	linters_by_ft = {
		go = { "golangcilint" },
		python = { "flake8" },
	},

	linters = {
		golangcilint = {
			args = {
				'run',
				'-E',
				'gofumpt',
				'--max-issues-per-linter',
				'0',
				'--max-same-issues',
				'0',
				'--out-format',
				'json',
				function()
					return vim.fn.fnamemodify(
						vim.api.nvim_buf_get_name(0),
						":h"
					)
				end,
			},
		},
	},
}

M.setup = function (opts)
	local lint = require("lint")

	lint.linters_by_ft = opts.linters_by_ft
	lint.linters.golangcilint.args = opts.linters.golangcilint.args

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("lint", { clear = true }),
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
