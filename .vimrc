set nocompatible
set tabstop=4
set shiftwidth=4
syntax enable
set noswapfile
set number
set cursorline

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'sainnhe/everforest'

call plug#end()

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1

nnoremap <C-d> :NERDTreeToggle<CR>

colorscheme everforest
