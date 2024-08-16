local opt = vim.opt
local o = vim.o
local g = vim.g

---------------------------- globals -------------------------------

-- netrw
g.netrw_banner = 0

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

---------------------------- options -------------------------------

-- general
vim.o.wrap = false
vim.o.scrolloff = 8
vim.o.swapfile = false
vim.opt.colorcolumn = '80'

-- cursor
o.cursorline = true
o.cursorlineopt = "number"

-- indenting
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true

-- statusline?
o.laststatus = 3
o.showmode = false
opt.fillchars = { eob = " " }

-- smartcase
o.smartcase = true

-- numbers
o.signcolumn = "yes"
o.number = true
o.relativenumber = true

-- no nvim intro
opt.shortmess:append "sI"

-- splits
o.splitbelow = true
o.splitright = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- spelling
o.spellsuggest = "best, 9"

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

--------------------------- terminal integration ---------------------------

-- colors
vim.cmd([[
	set t_Co=256
	if exists('+termguicolors')
		let &t_8f = "\e[38;2;%lu;%lu;%lum"
		let &t_8b = "\e[48;2;%lu;%lu;%lum"
		set termguicolors
	endif
]])

-- kitty cursor
vim.cmd([[
	if $TERM == "xterm-kitty"
		set mouse=a
		try
			" undercurl support
			let &t_Cs = "\e[4:3m"
			let &t_Ce = "\e[4:0m"
		catch
		endtry
		" Change the cursor in different modes
		let &t_SI = "\e[5 q"
		let &t_SR = "\e[3 q"
		let &t_EI = "\e[1 q"
		" vim hardcodes background color erase even if the terminfo file does
		" not contain bce. This causes incorrect background rendering when
		" using a color theme with a background color.
		let &t_ut=''
	endif
]])
