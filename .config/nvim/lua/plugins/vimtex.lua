return {
	"lervag/vimtex",
	lazy = false,
	init = function ()
		vim.g.vimtex_syntax_enabled = 1
		vim.g.vimtex_quickfix_open_on_warning = 0
		vim.g.vimtex_syntax_conceal_disable = 1
	end,
}
