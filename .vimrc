" Configuration file for vim
set modelines=0     " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1


" My configs

" set t_Co=256
colorscheme mycolorscheme

" Window Display Styles
filetype plugin indent on
syntax on       " highlight
set background=dark
set number      " line number
set colorcolumn=80

set cursorline cursorcolumn

set foldmethod=manual   " use this before I figure out how to use folds
set foldcolumn=1    " enough for me, I only use one

" Status Bar
set ruler       " cursor pos
set showcmd     " show command
set laststatus=2

set scrolloff=4 " lines under / above cursor-line
set mouse=a

" Split Windows
set splitbelow
set splitright


" Editing
" Indentation
set smartindent
set autoindent

" TABs
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set smarttab

" Searching
set hlsearch    " search highlight
set incsearch   " search while typing
" set showmatch   " hl matching brackets
" set matchtime=5


" File
" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

" Saving / Backup
set autowrite   " write when switching buffer
set confirm     " confirm before :q etc.

" set modeline
" set modelines=5


" Personal Code Style Preferences
" Tabs
autocmd BufEnter *.[c|h][pp]?       set sw=2
autocmd BufEnter *.[js|html|css]    set sw=2 cc=120
autocmd BufEnter *.py               set sw=4

