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
set noswapfile

if has("patch-8.1.1564")
	set signcolumn=number
else
	set signcolumn=yes
endif

" Needed this on MacOS
set backspace=indent,eol,start

" Plug {{{

	if has('nvim')
		call plug#begin(stdpath('data') . '/plugged')
	else
		call plug#begin('~/.vim/plugged')
	endif

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
	Plug 'sheerun/vim-polyglot'
	Plug 'chriskempson/base16-vim'

	call plug#end()

"}}}

" syntax {{{{

if has("termguicolors")
	" enabling st support
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

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
"inoremap <up> <nop>
"inoremap <down> <nop>
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

tnoremap jk <C-\><C-n>

"}}}

" augroups {{{

augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_swayconfig
	autocmd!
	autocmd FileType swayconfig setlocal foldmethod=marker

augroup filetype_c_cpp
	autocmd!
	autocmd FileType cpp nnoremap <buffer> <localleader>- I//<space><esc>
	autocmd FileType c,cpp setlocal foldmethod=marker
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

" CoC config {{{

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
