local M = {}

M.options = {
	linters_by_ft = {
		go = { "golangcilint" },
		python = { "flake8" },
	},
}

M.setup = function (opts)
	local lint = require("lint")

	lint.linters_by_ft = opts.linters_by_ft

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("lint", { clear = true }),
		callback = function()
			lint.try_lint()
		end,
	})
end

return M
