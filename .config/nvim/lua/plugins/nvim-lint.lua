local options = {
	linters_by_ft = {
		go = { "golangcilint" },
		python = { "flake8" },
	},
}


local function setup (opts)
	local lint = require("lint")
	lint.linters_by_ft = opts.linters_by_ft

	local pattern = '[^:]+:(%d+):(%d+):(%w+):(.+)'
	local groups = { 'lnum', 'col', 'code', 'message' }
	lint.linters.flake8 = {
	  cmd = "flake8",
	  stdin = true,
	  args = {
		"--max-line-length=100",
		"--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s",
		"--no-show-source",
		"--stdin-display-name",
		function() return vim.api.nvim_buf_get_name(0) end,
		"-",
	  },
	  ignore_exitcode = true,
	  parser = require("lint.parser").from_pattern(pattern, groups, nil, {
		["source"] = "flake8",
		["severity"] = vim.diagnostic.severity.WARN,
	  }),
	}

	vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("lint", { clear = true }),
		callback = function()
			lint.try_lint()
		end,
	})
end

return {
	"mfussenegger/nvim-lint",
	config = function()
		return setup(options)
	end
}
