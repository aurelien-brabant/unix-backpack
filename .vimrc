set nocompatible
set number
set relativenumber
syntax enable
set wrap

" Identation
set tabstop=4
set shiftwidth=4
set showmatch
set matchtime=2

" standard keybindings, using control key

let mapleader = ','
let maplocalleader = '\\'

" standard editing mappings, using the 'control' key modifier
nnoremap <c-a> 0v$

nnoremap <c-d> :Texplore<cr>

" uppercase current word (from and to NORMAL mode)
nnoremap <leader>u viwU

" open my .vimrc in a new tab
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
" nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" nnoremap <leader>` viw<esc>a`<esc>hbi`<esc>lel

" surround selection with single quotes
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>

" surround selection with double quotes
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>

" surround selection with backticks ('`')
vnoremap <leader>` <esc>`<i`<esc>`>a`<esc>

" quicker than pressing esc
inoremap jk <esc>

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <esc> <nop>

nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>

" abbreviations

iabbrev thne then
iabbrev adn and
iabbrev 42@@ abrabant@student.42.fr
iabbrev perso@@ perso@aurelienbrabant.fr

iabbrev ssig --- <cr>Aurélien Brabant<cr>Email: contact@aurelienbrabant.fr<cr>Website: https://aurelienbrabant.fr
