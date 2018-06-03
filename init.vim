" Configuration file for vim
set modelines=0     " CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing

" automatic install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

let g:python3_host_prog = '/home/smdsbz/.config/nvim/neovim3/bin/python3'

" Look Better?
set termguicolors
Plug 'joshdick/onedark.vim'
" let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
" Plug 'tomasr/molokai'
" let g:molokai_original = 1
" Plug 'rakr/vim-one'
" let g:one_allow_italics = 1
" Plug 'gosukiwi/vim-atom-dark'
" Advanced Language Syntax Highlight
Plug 'sheerun/vim-polyglot'       " one-to-rule-it-all syntax plugin
Plug 'chrisbra/csv.vim'           " better looking of csv
" from 'ioctol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_class_decl_highlight=1
" from 'vim-python/python-syntax'
let g:python_highlight_all=1
let g:python_version_2=0
let g:python_highlight_space_errors=0
" Enhanced Motion
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
set signcolumn=yes              " always show column
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=0
" Enhanced Editing
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
" Misc
Plug 'luochen1990/rainbow'        " just admit it, everyone needs this :)
let g:rainbow_active = 0          " off unless specified :RainbowToogle
Plug 'vim-airline/vim-airline'    " better status line
let g:airline#extensions#tabline#enabled=1  " airline themed tabline
let g:airline#extensions#tabline#show_tab_type=0    " only tabs
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#tab_nr_type=1  " display index of the tabpage
let g:airline#extensions#tabline#overflow_marker='…'
let g:airline#extensions#tabline#formatter='unique_tail_improved'   " short filenames in tabline
" let g:airline#extensions#tabline#left_sep = '▌'
" let g:airline#extensions#tabline#left_alt_sep = '│'
" let g:airline#extensions#tabline#right_sep = '▐'
" let g:airline#extensions#tabline#right_alt_sep = '│'
let g:airline#extensions#tabline#left_sep = '▒'
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_sep = '▒'
let g:airline#extensions#tabline#right_alt_sep = ' '
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button=0    " no one use it
" let g:airline_mode_map = {
"   \ '__' : '-',
"   \ 'n'  : 'N',
"   \ 'i'  : 'I',
"   \ 'R'  : 'R',
"   \ 'c'  : 'C',
"   \ 'v'  : 'V',
"   \ 'V'  : 'V-LINE',
"   \ '' : 'V-BLOCK',
"   \ 's'  : 'S',
"   \ 'S'  : 'S',
"   \ '' : 'S',
"   \ }
" let g:airline_left_sep = '▌'
" let g:airline_right_sep = '▐'
let g:airline_left_sep = '▒'
let g:airline_left_alt_sep = '│'
let g:airline_right_sep = '▒'
let g:airline_right_alt_sep = '│'
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#alt_sep = 1
let g:airline_detect_iminsert = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme = 'angr'
let g:airline_theme = 'onedark'
" let g:airline_theme = 'molokai'
" let g:airline_theme = 'one'
" NOTE: vim-airline-clock causing memory leak!
" Plug 'enricobacis/vim-airline-clock'
" let g:airline#extensions#clock#format = '│ %b %d %T'
" let g:airline#extensions#clock#updatetime = 1000
Plug 'terryma/vim-smooth-scroll'  " should have better experience using term
                                    " other than mac ones
if has('nvim')
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>
endif
" Plug 'itchyny/vim-cursorword'
" Auto-Complete
if has('nvim')
    " Non-Async Completes
    " Plug 'Rip-Rip/clang_complete' " C/C++
    " let g:clang_use_library=1
    " let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
    " Async Completes
    Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup=1
    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
    " " (Optional) Multi-entry selection UI.
    " Plug 'junegunn/fzf'
    Plug 'Shougo/denite.nvim'
    " C/C++
    Plug 'Shougo/deoplete-clangx'
    Plug 'Shougo/neoinclude.vim'
    " Plug 'tweekmonster/deoplete-clang2'
    " let g:deoplete#sources#clang#autofill_neomake=0
    " Python
    Plug 'zchee/deoplete-jedi'
    " JavaScript
    Plug 'wokalski/autocomplete-flow'
    " Emoji
    Plug 'fszymanski/deoplete-emoji'
endif
" airline decor
" let g:airline_section_b = '[̲̅$̲̅(̲̅ιοο̲̅)̲̅$̲̅]'
let g:airline_section_b = '┬┴┤･ω･)ﾉ├┬┴┬┴'
" let g:airline_section_b = '≈≈≈[,,_,,]:3'

call plug#end()
filetype plugin indent on


augroup backup_strategies
    au!
    " Don't write backup file if vim is being called by "crontab -e"
    au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
    " Don't write backup file if vim is being called by "chpass"
    au BufWrite /private/etc/pw.* set nowritebackup nobackup
augroup END

if has("persistent_undo")
    set undodir=~/.vim_undodir/
    set undofile
endif

let skip_defaults_vim=1


" My configs

set background=dark
" mycolorscheme
" colorscheme mycolorscheme
colorscheme onedark
" colorscheme molokai
" colorscheme one
" colorscheme atom-dark-256

" more convenient <Leader> key
let mapleader="\ "
" list chars - no more TAB and nbsp issues!
set listchars=tab:»-,trail:·
set list
" vertical split char
set fillchars+=vert:\│

" Window Display Styles
filetype plugin indent on

" more highlight on Todo labels
augroup highlight_todos
    autocmd!
    autocmd BufEnter * match Todo /\v<(TODO|HACK|NOTE|CMBK|DEBUG):/
augroup END

syntax on               " highlight

set nonumber norelativenumber   " line number
set colorcolumn=80      " Very Pythonic

set cursorline
" set colorcolumn

set foldmethod=syntax   " code folding: deal with loooooong code blocks
set foldnestmax=2       " too many numbers on left would be a bother
set foldlevel=5         " show all code on start-up
set foldcolumn=4        " show fold open/close: enough for me, I only use one
" general short-hand for folding bracket-closed blocks
" nnoremap <Leader>z vf{%zf
" jump to first line of the previous fold
" nnoremap zk 2zkzj


" Status Bar
set ruler               " cursor pos
set noshowmode          " already have vim-airline
set showcmd             " show command
set laststatus=2        " always show statusline, otherwise only when in split
set showtabline=2

" Movement
set scrolloff=5 " lines under / above cursor-line
set mouse=a
" scroll faster!
nnoremap <silent> <C-e> <C-e>:sleep 4m<CR><C-e>:sleep 4m<CR><C-e>
nnoremap <silent> <C-y> <C-y>:sleep 4m<CR><C-y>:sleep 4m<CR><C-y>

" Split Windows
set splitbelow
set splitright
" simpler surfing through splits
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
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
" keep selected after shifting
vnoremap < <gv
vnoremap > >gv

" Moving Cursor
" Searching
set hlsearch    " search highlight
nohlsearch      " don't show on every :source
set incsearch   " search while typing
" <BS> to clear view - nohl and close preview panel
nnoremap <BS> :nohlsearch<CR><C-W>z
" set showmatch
" set matchtime=5
" Visual
" move to visual border easily
" vnoremap <Left> <Esc>`<
" vnoremap <Right> <Esc>`>

if has('nvim')
    set inccommand=nosplit
endif

" Auto-Complete
set path+=**
set ignorecase  " default ignore case when completing
set smartcase   " will stop if you type an uppercase
set wildmode=list:longest,full
set completeopt=menu,menuone,longest,noselect,preview
set previewheight=2     " preview-window to display args for completed functons


" Copy / Paste
" set clipboard=unnamed
vnoremap y "+y

" Misc
" set matchpairs+=<:>


" File
" Netrw tweaks
let g:netrw_banner=0    " disable help banner
let g:netrw_winsize=25
let g:netrw_browse_split=4
let g:netrw_altv=1
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
    nnoremap <silent> <C-\> :split<CR>:term<CR>:resize 30<CR>a
endif


" Line Number Settings
" augroup linenr_toogle
"     autocmd!
"     autocmd BufEnter * setlocal relativenumber
"     autocmd BufLeave * setlocal norelativenumber
" augroup END

" Personal Code Style Preferences
augroup filetype_specifics
    autocmd!
    autocmd FileType markdown nnoremap <buffer> <C-q> :!typora % &<CR><CR>
    autocmd FileType markdown setlocal cc=120
    " C - case {<CR> indentation fixup
    autocmd FileType c      setlocal cindent cinoptions=l1
    autocmd FileType c      setlocal sw=2
    autocmd FileType c      setlocal makeprg=make
    " C++ - same as above
    autocmd FileType cpp    setlocal cindent cinoptions=l1
    autocmd FileType cpp    setlocal sw=2
    autocmd FileType cpp    setlocal makeprg=make
    autocmd FileType html*  setlocal sw=2 cc=120
    autocmd FileType javascript*    setlocal sw=2
    autocmd FileType javascript*    setlocal makeprg=npm\ start
    autocmd FileType json   setlocal sw=2 cc=120
    autocmd FileType css    setlocal sw=2
    autocmd FileType python setlocal sw=4 foldmethod=indent
    " don't jump to first col when inserting inline comments
    autocmd FileType python inoremap # X<c-h>#
    autocmd BufEnter *.wxml setlocal filetype=xml sw=2 cc=120
    autocmd FileType asm    setlocal sw=8 ts=8
    autocmd BufEnter *.ASM  setlocal filetype=asm
augroup END

