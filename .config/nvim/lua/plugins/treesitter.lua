local options = {
	ensure_installed = {
		'lua',
		'luadoc',
		'printf',
		'vim',
		'vimdoc',
		'c',
		'go',
		'gitcommit',
		'comment',
		'javascript',
		'tsx',
		'vue',
		'make',
		'python',
		'rust',
		'latex',
		'typst',
	}
}

local function config (opts)
	local ts = require('nvim-treesitter')
	if opts.ensure_installed ~= nil then
		ts.install(opts.ensure_installed)
	end
	vim.api.nvim_create_autocmd('FileType', {
	  pattern = ts.get_installed(),
	  callback = function() vim.treesitter.start() end,
	})
end

return {
	'nvim-treesitter/nvim-treesitter',
	commit = '4916d65',
	build = ':TSUpdate',
	branch = 'main',
	lazy = false,
	config = function ()
		return config(options)
	end
}
