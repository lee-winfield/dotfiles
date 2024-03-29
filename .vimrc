""" Map leader to space ---------------------
let mapleader=" "

""" Color Scheme ---------------------------
colorscheme murphy

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

""" Plugins  --------------------------------
call plug#begin('~/.vim/plugged')
 
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'

call plug#end()

""" Plugin settings -------------------------
let g:argtextobj_pairs="[:],(:),<:>"

""" Common settings -------------------------
set showmode
set so=5
set incsearch
set nu
set showcmd
set clipboard+=unnamed
set number relativenumber

""" Mappings --------------------------------
