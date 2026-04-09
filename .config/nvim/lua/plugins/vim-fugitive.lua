return {
	'tpope/vim-fugitive',
	keys = {
		{ '<leader>Gs', '<cmd>G<CR><C-w>k<cmd>q<CR>', mode = 'n', desc = 'full git status' },
		{ '<leader>Gd', '<cmd>Gvdiffsplit<CR>',       mode = 'n', desc = 'full git status' }
	}
}
