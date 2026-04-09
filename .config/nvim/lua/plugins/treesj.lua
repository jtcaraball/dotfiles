return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	keys = {
		{
			'<leader>ss',
			function()
				require('treesj').toggle()
			end,
			mode = 'n',
			desc = 'split function',
			silent = true,
		}
	},
	config = function()
		require('treesj').setup({
			use_default_keymaps = false,
		})
	end,
}
