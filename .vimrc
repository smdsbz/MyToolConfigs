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
" Enhanced Motion
Plugin 'easymotion/vim-easymotion'
" Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
" Plugin 'Townk/vim-autoclose'
" Misc
Plugin 'luochen1990/rainbow'        " just admit it, everyone needs this :)
let g:rainbow_active = 0            " off unless specified :RainbowToogle
Plugin 'vim-airline/vim-airline'    " Migrated from Atom.io
Plugin 'terryma/vim-smooth-scroll'  " should have better experience using term
                                    " other than mac ones
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>
Plugin 'itchyny/vim-cursorword'

call vundle#end()
filetype plugin indent on
" End of Vundle Settings


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1


" My configs

source ~/.vim/colors/mycolorscheme.vim
colorscheme mycolorscheme

" Window Display Styles
filetype plugin indent on
syntax on               " highlight
" set background=dark
set number              " line number
set colorcolumn=80      " Very Pythonic

set cursorline cursorcolumn

set foldmethod=manual   " code folding: deal with loooooong code blocks
set foldcolumn=1        " show fold open/close: enough for me, I only use one
" general short-hand for folding bracket-closed blocks
nnoremap <Leader>z v$%zf


" Status Bar
set ruler               " cursor pos
set showcmd             " show command
set laststatus=2        " always show statusline, otherwise only when multi-window

" Movement
set scrolloff=4 " lines under / above cursor-line
" scroll faster!
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
" too far to reach!
nnoremap H ^
nnoremap L $
set mouse=a

" Split Windows
set splitbelow
set splitright
" simpler surfing through splits
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" simpler surfing through tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
" tabmoves - right and left
nnoremap <Leader>>> :+tabmove<CR>
nnoremap <Leader><< :-tabmove<CR>


" Editing
" Indentation
set smartindent
set autoindent

" TABs
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set smarttab
" TAB once, get in place!
" use `cc` instead!
" nnoremap <TAB> ddO
" keep selected after shifting
vnoremap < <gv
vnoremap > >gv

" Searching
set hlsearch    " search highlight
nohlsearch      " don't show on every :source
set incsearch   " search while typing
nnoremap <BS> :nohlsearch<CR>
" set showmatch
" set matchtime=5

" Auto-Complete
set path+=**
set ignorecase  " default ignore case when completing
set smartcase   " will stop if you type an uppercase
set wildmode=list:longest,full
set completeopt=menu,longest,preview,noselect

" Misc
set matchpairs+=<:>


" File
" Netrw tweaks
let g:netrw_banner=0    " disable help banner
let g:netrw_liststyle=3

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

" Saving / Backup
set autowrite   " write when switching buffer
set confirm     " confirm before :q etc.

" set modeline
" set modelines=5


" Personal Code Style Preferences
augroup filetype_specifics
    autocmd!
    autocmd FileType c      setlocal sw=2
    " C - case {<CR> indentation fixup
    autocmd FileType c      setlocal cindent cinoptions=l1
    autocmd FileType c      setlocal makeprg=make
    autocmd FileType cpp    setlocal sw=2
    " C++ - same as above
    autocmd FileType cpp    setlocal cindent cinoptions=l1
    autocmd FileType cpp    setlocal makeprg=make
    autocmd FileType html   setlocal sw=2 cc=120
    autocmd FileType javascript setlocal sw=2
    autocmd FileType css    setlocal sw=2
    autocmd FileType python setlocal sw=4
    " don't jump to first col when inserting inline comments
    autocmd FileType python inoremap # X<c-h>#
augroup END

