set nocompatible
set number
set relativenumber
set wrap
set smartindent
set cursorline
set tabstop=4
set shiftwidth=4
set showmatch
set matchtime=2
set encoding=utf-8
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

" Needed this on MacOS
set backspace=indent,eol,start

" Plug {{{

	call plug#begin('~/.vim/plugged')

	Plug 'sainnhe/everforest'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	call plug#end()

" }}}

" syntax {{{{

if has("termguicolors")
	" enabling st support
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark
let g:everforest_background = 'hard'
colorscheme everforest
syntax enable

" }}}

" list {{{

set list
set listchars=tab:→\ ,trail:.

" }}}

" statusline {{{

set laststatus=2
set statusline=%f\ \|\ FileType:\ %y\ \|\ %l/%L

" }}}

" mappings {{{

let mapleader = ','
let maplocalleader = '\\'

" standard editing mappings, using the 'control' key modifier
nnoremap <c-a> 0v$

nnoremap <c-d> :Texplore<cr>

" .vimrc manipulation
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" surround selection with single quotes
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" surround selection with double quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" surround selection with backticks ('`')
vnoremap <leader>` <esc>`<i`<esc>`>a`<esc>

" quick <esc> replacement
inoremap jk <esc>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <esc> <nop>

" delete parameters operator mapping
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col |
endfunction

"}}}

" augroups {{{

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_c_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>- I//<space><esc>
	autocmd FileType c,cpp setlocal foldmethod=syntax foldlevel=99
augroup END

augroup filetype_typescript
	autocmd!
	autocmd FileType javascript,typescript nnoremap <buffer> <localleader>- I//<space><esc>
augroup END

augroup filetype_markdown
	autocmd!
	autocmd FileType markdown set spell
augroup end

" }}}

" abbreviations {{{

iabbrev thne then
iabbrev adn and
iabbrev 42@@ abrabant@student.42.fr
iabbrev perso@@ perso@aurelienbrabant.fr
iabbrev ssig --- <cr>Aurélien Brabant<cr>Email: contact@aurelienbrabant.fr<cr>Website: https://aurelienbrabant.fr

" }}}
