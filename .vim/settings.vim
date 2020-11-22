" No create backupfile
set nowritebackup
set nobackup

" Setting for file encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

" Map leader to ,
let mapleader=','

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

syntax on
set number

let no_buffers_menu=1

set mousemodel=popup
set t_Co=256

set laststatus=2

set background=dark

set imdisable

" Python setting
let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

