#!/bin/bash
#This script clones the official vundle github repository into your homedirectory
#then creates a new .vimrc and writes all the neat stuff into it that you need to make vim great
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#Creates .vimrc file in homedir
touch ~/.vimrc
#writes into .vimrc file
cat > ~/.vimrc <<- "EOF"
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
call vundle#end()            " required
filetype plugin indent on    " required

" enable folding and loading vundle plugin for code-folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'

" enable proper python indentation
au BufNewFile,Bufread *.py set tabstop=4 softtabstop=3 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

"Color Scheme
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
call togglebg#map("<F5>")
"LineNumbers
set nu
"Autocomplete Python
Plugin 'davidhalter/jedi-vim'
EOF

