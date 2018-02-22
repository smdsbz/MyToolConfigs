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

" Look Better?
" Plugin 'joshdick/onedark.vim'
" Plugin 'rakr/vim-one'
" Advanced Language Syntax Highlight
Plugin 'sheerun/vim-polyglot'       " one-to-rule-it-all syntax plugin
" from 'ioctol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
" from 'vim-python/python-syntax'
let g:python_highlight_all=1
let g:python_version_2=0
let g:python_highlight_space_errors=0
" Enhanced Motion
Plugin 'easymotion/vim-easymotion'
" Plugin 'terryma/vim-multiple-cursors'
" set g:multi_cursor_exit_from_insert_mode=1
" Enhanced Editing
Plugin 'tpope/vim-commentary'
" Plugin 'Townk/vim-autoclose'
" Misc
Plugin 'luochen1990/rainbow'        " just admit it, everyone needs this :)
let g:rainbow_active = 0            " off unless specified :RainbowToogle
Plugin 'vim-airline/vim-airline'    " better status line
Plugin 'terryma/vim-smooth-scroll'  " should have better experience using term
                                    " other than mac ones
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>
" Plugin 'itchyny/vim-cursorword'
" Auto-Complete
if has('nvim')
    " Non-Async Completes
    Plugin 'Rip-Rip/clang_complete' " C/C++
    let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
    " Async Completes
    Plugin 'Shougo/deoplete.nvim'
    let g:deoplete#enable_at_startup=1
    Plugin 'zchee/deoplete-jedi'    " Python
    " dedicate python runtime for completion
    let g:python3_host_prog='/Users/smdsbz/.vim/nvim-py3/bin/python3'
endif

call vundle#end()
filetype plugin indent on
" End of Vundle Settings


" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1


" My configs

" mycolorscheme
source ~/.vim/colors/mycolorscheme.vim
colorscheme mycolorscheme
" onedark
" set termguicolors
" syntax on
" colorscheme onedark
" let g:onedark_termcolors=256
" let g:onedark_terminal_italics=1
" vim-one
" set termguicolors
" colorscheme one
" set background=dark

" More Todos
match Todo /\vTODO:|HACK:|NOTE:|CMBK:|DEBUG:/

" list chars - no more TAB and nbsp issues!
set listchars=tab:»·,trail:·
set list

" Window Display Styles
filetype plugin indent on
syntax on               " highlight
" set background=dark
set number              " line number
set colorcolumn=80      " Very Pythonic

set cursorline cursorcolumn

set foldmethod=manual   " code folding: deal with loooooong code blocks
set foldcolumn=3        " show fold open/close: enough for me, I only use one
" general short-hand for folding bracket-closed blocks
nnoremap <Leader>z v$%zf

" Mode specific cursor style
" from https://github.com/mhinz/vim-galore#change-cursor-style-dependent-on-mode
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif


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
" simple vim-surround under visual-mode
vnoremap ( <Esc>`<i(<Esc>`>la)<Esc>

" TABs
set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set smarttab
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
set completeopt=menu,menuone,longest,noselect
" simple pair brackets
inoremap {<CR> {<CR>}<C-o>O

" Copy / Paste
set clipboard=unnamed

" Misc
" set matchpairs+=<:>


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


" Neovim Settings
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
    " tnoremap <Leader>1 <C-\><C-n>1gt
    " tnoremap <Leader>2 <C-\><C-n>2gt
    " tnoremap <Leader>3 <C-\><C-n>3gt
    " tnoremap <Leader>4 <C-\><C-n>4gt
    " tnoremap <Leader>5 <C-\><C-n>5gt
    " tnoremap <Leader>6 <C-\><C-n>6gt
    " tnoremap <Leader>7 <C-\><C-n>7gt
    " tnoremap <Leader>8 <C-\><C-n>8gt
    " fast open terminal below
    nnoremap <silent> <C-\> :split term://zsh<CR>:resize 40<CR>a
endif



" Personal Code Style Preferences
augroup filetype_specifics
    autocmd!
    " C - case {<CR> indentation fixup
    autocmd FileType c      setlocal cindent cinoptions=l1
    autocmd FileType c      setlocal sw=2
    autocmd FileType c      setlocal makeprg=make
    " C++ - same as above
    autocmd FileType cpp    setlocal cindent cinoptions=l1
    autocmd FileType cpp    setlocal sw=2
    autocmd FileType cpp    setlocal makeprg=make
    autocmd FileType html   setlocal sw=2 cc=120
    autocmd FileType javascript setlocal sw=2
    autocmd FileType css    setlocal sw=2
    autocmd FileType python setlocal sw=4
    " don't jump to first col when inserting inline comments
    autocmd FileType python inoremap # X<c-h>#
augroup END

