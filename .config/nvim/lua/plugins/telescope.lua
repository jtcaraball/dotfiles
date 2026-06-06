local function find_command()
	if 1 == vim.fn.executable('fd') then
		return {
			'fd',
			'--type',
			'f',
			'--color',
			'never',
			'-E',
			'.git',
			'-E',
			'node_modules',
			'-E',
			'target',
		}
	elseif 1 == vim.fn.executable('rg') then
		return { 'rg', '--files', '--color', 'never', '-g', '!.git' }
	elseif 1 == vim.fn.executable('fdfind') then
		return { 'fdfind', '--type', 'f', '--color', 'never', '-E', '.git' }
	elseif 1 == vim.fn.executable('find') and vim.fn.has('win32') == 0 then
		return { 'find', '.', '-type', 'f' }
	elseif 1 == vim.fn.executable('where') then
		return { 'where', '/r', '.', '*' }
	end
end

return {
	'nvim-telescope/telescope.nvim',
	commit = '7d32479',
	command = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{
			'<leader>ff',
			'<cmd>Telescope find_files<CR>',
			mode = 'n',
			desc = 'Find files',
		},
		{
			'<leader>fz',
			'<cmd>Telescope live_grep<CR>',
			mode = 'n',
			desc = 'Fuzzy over files',
		},
		{
			'<leader>fa',
			'<cmd>Telescope find_files hidden=true<CR>',
			mode = 'n',
			desc = 'Find all files',
		},
	},
	opts = {
		defaults = {
			prompt_prefix = ' 🔭 ',
			selection_caret = ' ',
		},
		pickers = {
			find_files = {
				find_command = find_command,
			},
		}
	}
}
