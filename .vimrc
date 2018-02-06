" Configuration file for vim
set modelines=0     " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing


" Vundle Settings
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Advanced Language Syntax Highlight
Plugin 'justinmk/vim-syntax-extra'  " C
Plugin 'hdima/python-syntax'        " Python
let python_highlight_all=1
" Enhanced Editing
Plugin 'easymotion/vim-easymotion'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
" Plugin 'Townk/vim-autoclose'
" Misc
Plugin 'luochen1990/rainbow'        " just admit it, everyone needs this :)
Plugin 'vim-airline/vim-airline'    " Migrated from Atom.io
" TODO: Personal tweaks
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>

call vundle#end()
filetype plugin indent on
" End of Vundle Settings


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1


" My configs

" More Todos
syn keyword myTodo contained TODO HACH NOTE CMBK
hi def link myTodo Todo

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

" Movement
set scrolloff=4 " lines under / above cursor-line
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
noremap H ^
noremap L $
set mouse=a

" Split Windows
set splitbelow
set splitright
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l



" Editing
" Indentation
set smartindent
set autoindent

" TABs
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set smarttab
" keep selected
vnoremap < <gv
vnoremap > >gv

" Searching
set hlsearch    " search highlight
set incsearch   " search while typing
" set showmatch   " hl matching brackets
" set matchtime=5

" Auto-Complete
set ignorecase
set smartcase
inoremap {<CR> {<CR>}<Esc>O


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
autocmd FileType c      setlocal sw=2
autocmd FileType cpp    setlocal sw=2
autocmd FileType html   setlocal sw=2 cc=120
autocmd FileType javascript setlocal sw=2
autocmd FileType css    setlocal sw=2
autocmd FileType python setlocal sw=4
autocmd FileType python inoremap # X<c-h>#
