set nocompatible

let mapleader = " "

" Syntax
if has('syntax')
  syntax on
endif

" General
set nowrap
set scrolloff=8
set noswapfile
set colorcolumn=80

" Numbers
set signcolumn=yes
set number
set relativenumber

" Search
set smartcase
set incsearch

" Tabs
set tabstop=4
set autoindent
set softtabstop=4
set shiftwidth=4

autocmd FileType python setlocal expandtab softtabstop=4 shiftwidth=4
autocmd FileType typescript setlocal expandtab softtabstop=2 shiftwidth=2
autocmd FileType typescriptreact setlocal expandtab softtabstop=2 shiftwidth=2
autocmd FileType vue setlocal expandtab softtabstop=2 shiftwidth=2

" Colors
set t_Co=256
if exists('+termguicolors')
	let &t_8f="\e[38;2;%lu;%lu;%lum"
	let &t_8b="\e[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" Trim white spaces
function TrimWhiteSpaces()
	%s/[ \t]*$//
	''
endfunction
autocm BufWritePre *.py call TrimWhiteSpaces()
autocm BufWritePre *.vue call TrimWhiteSpaces()
autocm BufWritePre *.c call TrimWhiteSpaces()
autocm BufWritePre *.ts call TrimWhiteSpaces()
autocm BufWritePre *.go call TrimWhiteSpaces()
autocm BufWritePre *.lua call TrimWhiteSpaces()

" Mappings
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <silent> <leader>/ :nohlsearch<CR>

noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>vs :vs<CR>
noremap <leader>hs :split<CR>
