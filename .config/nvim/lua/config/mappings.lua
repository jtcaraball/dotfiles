local map = vim.keymap.set

-- navigation
map('n', '<leader>h', '<C-w>h', { desc = 'switch window left' })
map('n', '<leader>l', '<C-w>l', { desc = 'switch window right' })
map('n', '<leader>j', '<C-w>j', { desc = 'switch window down' })
map('n', '<leader>k', '<C-w>k', { desc = 'switch window up' })
map(
	'n',
	'<leader>vs',
	':vsplit<CR>',
	{ desc = 'switch window up', silent = true }
)
map(
	'n',
	'<leader>hs',
	':split<CR>',
	{ desc = 'switch window up', silent = true }
)

-- netrw
map(
	'n',
	'<leader>nt',
	':Ex<CR>',
	{ desc = 'open netrw', silent = true }
)

-- find files
map(
	'n',
	'<leader>ff',
	':find ',
	{ desc = 'start finding' }
)

map(
	'n',
	'<leader>fz',
	':silent :grep  | :copen<Left><Left><Left><Left><Left><Left><Left><Left><Left>',
	{ desc = 'we got grep at home' }
)

-- for old times sake
map('n', '<Up>', '<Nop>')
map('n', '<Down>', '<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

-- global lsp mappings
map(
	'n',
	'<leader>dl',
	function()
		vim.diagnostic.setloclist()
		vim.cmd('lopen')
	end,
	{ desc = 'lsp diagnostic loclist' }
)
map(
	'n',
	'<leader>df',
	function()
		vim.diagnostic.setqflist()
		vim.cmd('copen')
	end,
	{ desc = 'lsp diagnostic quick fix list' }
)

-- miscellaneous
map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })
map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'yank to system\'s clipboard' })
map({ 'n' }, '<leader>Y', [["+Y]], { desc = 'YANK to system\'s clipboard' })

-- conform
map('n', '<leader>fm', function()
	require('conform').format { lsp_fallback = true }
end, { desc = 'format file' })
