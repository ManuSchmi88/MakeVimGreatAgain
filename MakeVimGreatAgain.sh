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

" enable folding and loading vundle plugin for code-folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
Plugin 'tmhedberg/SimpylFold'

" enable proper python indentation
au BufNewFile,Bufread *.py set tabstop=4 softtabstop=3 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

"Color Scheme
"Plugin 'jnurmine/Zenburn'
"Plugin 'altercation/vim-colors-solarized'
"if has('gui_running')
"	set background=dark
"	colorscheme solarized
"else
"	colorscheme zenburn
"endif
"call togglebg#map("<F5>")
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

#Configures .tmux.conf:
#Creates .vimrc file in homedir
touch ~/.tmux.conf
#writes into .vimrc file
cat > ~/.tmux.conf <<- "EOF"
# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour166 #base02
set-option -g pane-active-border-fg colour67 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green

# bell
set-window-option -g window-status-bell-style fg=colour235,bg=colour160 #base02, red
set -g default-terminal "screen-256color"
EOF
