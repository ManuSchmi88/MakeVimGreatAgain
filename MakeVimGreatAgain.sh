#!/bin/bash
#This script configurates vim on a unix system. First it clones Vundle into the git directory
#then creates a new .vimrc and writes all the neat stuff into it that you need to make vim great
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Creates .vimrc file in homedir
touch ~/.vimrc
#writes into .vimrc file
cat > ~/.vimrc <<- "EOF"
nnoremap <leader>q :bp<cr>:bd #<cr>
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
"
call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" enable folding and loading vundle plugin for code-folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'

" enable proper python indentation
au BufNewFile,Bufread *.py set tabstop=4 softtabstop=3 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

Plugin 'desertink'
colorscheme desertink
"LineNumbers
set nu

"Autocomplete Python
Plugin 'davidhalter/jedi-vim'

"VimAirlineDashbar
Plugin 'vim-airline/vim-airline'
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '> '

"Nerd-Tree Plugin"
Plugin 'scrooloose/nerdtree'
autocmd vimenter * NERDTree

"BuffKill
Plugin 'qpkorr/vim-bufkill'
EOF

