" Begining {{{
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

" more convenient <Leader> key
let mapleader="\ "

" }}}

" Plugins {{{

call plug#begin('~/.local/share/nvim/plugged')

let g:python3_host_prog = '/home/smdsbz/.config/nvim/neovim3/bin/python3'

" Terminal 256-color {{{
if (has("termguicolors"))
    set termguicolors
endif
" }}}

" Color Schemes {{{
Plug 'joshdick/onedark.vim'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
Plug 'tomasr/molokai'
let g:molokai_original=1
let g:rehash256=1
Plug 'sjl/badwolf'
let g:badwolf_tabline=1
let g:badwolf_css_props_highlight=1
Plug 'ayu-theme/ayu-vim'
let ayucolor="dark"
" }}}

" Syntax Highlighting {{{
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
" Misc
" Plug 'itchyny/vim-cursorword'
Plug 'luochen1990/rainbow'        " just admit it, everyone needs this :)
let g:rainbow_active = 0          " off unless specified :RainbowToogle
nnoremap <silent> <Leader>tr :RainbowToggle<CR>
Plug 'lfv89/vim-interestingwords'
let g:interestingWordsRandomiseColors = 1
" }}}

" Enhanced Motion {{{
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
set signcolumn=yes              " always show column
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_exit_from_visual_mode=1
let g:multi_cursor_exit_from_insert_mode=0
Plug 'terryma/vim-smooth-scroll'    " should have better experience using term
                                    " other than mac ones
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 3, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 3, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>

" nnoremap <silent> <C-e> :call smooth_scroll#down(4, 1, 1)<CR>
" nnoremap <silent> <C-y> :call smooth_scroll#up(4, 1, 1)<CR>
nnoremap <silent> <C-e> <C-e>:redraw<CR>:sleep 1m<CR><C-e>:redraw<CR>:sleep 1m<CR><C-e>:redraw<CR>:sleep 1m<CR><C-e>:redraw<CR>:sleep 1m<CR>
nnoremap <silent> <C-y> <C-y>:redraw<CR>:sleep 1m<CR><C-y>:redraw<CR>:sleep 1m<CR><C-y>:redraw<CR>:sleep 1m<CR><C-y>:redraw<CR>:sleep 1m<CR>
" }}}

" Enhanced Editing {{{
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsCenterLine = 0
" }}}

" Popular Plugins {{{

" NERDTree {{{
Plug 'scrooloose/nerdtree'
nmap <silent> <Leader>ft :NERDTreeToggle<CR>
Plug 'Xuyuanp/nerdtree-git-plugin'
" }}}

" Airline {{{
Plug 'vim-airline/vim-airline'    " better status line
" Tabs and Buffers {{{
let g:airline#extensions#tabline#enabled=1  " airline themed tabline
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tabline#show_splits=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#tab_nr_type=1  " display index of the tabpage
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ',
      \ '1': '1 ',
      \ '2': '2 ',
      \ '3': '3 ',
      \ '4': '4 ',
      \ '5': '5 ',
      \ '6': '6 ',
      \ '7': '7 ',
      \ '8': '8 ',
      \ '9': '9 '
      \}
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>h <Plug>AirlineSelectPrevTab
nmap <leader>l <Plug>AirlineSelectNextTab
" }}}
" Appearance {{{
let g:airline#extensions#tabline#overflow_marker='…'
let g:airline#extensions#tabline#formatter='unique_tail_improved'   " short filenames in tabline
let g:airline#extensions#tabline#overflow_marker = '…'
" let g:airline#extensions#tabline#left_sep = '▌'
" let g:airline#extensions#tabline#left_alt_sep = '│'
" let g:airline#extensions#tabline#right_sep = '▐'
" let g:airline#extensions#tabline#right_alt_sep = '│'
" let g:airline#extensions#tabline#left_sep = '▒'
" let g:airline#extensions#tabline#left_alt_sep = ' '
" let g:airline#extensions#tabline#right_sep = '▒'
" let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button=0    " no one use it
let g:airline_exclude_preview=1
let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'VL',
        \ '' : 'VB',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ }
" let g:airline_left_sep = '▌'
" let g:airline_right_sep = '▐'
" let g:airline_left_sep = '▒'
" let g:airline_left_alt_sep = '│'
" let g:airline_right_sep = '▒'
" let g:airline_right_alt_sep = '│'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#alt_sep = 0
let g:airline_detect_iminsert = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" }}}
" Theming {{{
Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme = 'angr'
let g:airline_theme = 'onedark'
" let g:airline_theme = 'badwolf'
" let g:airline_theme='powerlineish'
" Plug 'bling/vim-bufferline'
" let g:airline#extensions#bufferline#enable=0
" let g:bufferline_echo=0
" NOTE: vim-airline-clock causing memory leak!
" Plug 'enricobacis/vim-airline-clock'
" let g:airline#extensions#clock#format = '│ %b %d %T'
" let g:airline#extensions#clock#updatetime = 1000
" airline decor
" let g:airline_section_b = '[̲̅$̲̅(̲̅ιοο̲̅)̲̅$̲̅]'
" let g:airline_section_b = '┬┴┤･ω･)ﾉ├┬┴┬┴'
" let g:airline_section_b = '≈≈≈[,,_,,]:3'
let g:airline_section_b = ''
" }}}
" }}}

" Tmux Integration {{{
Plug 'tmux-plugins/vim-tmux-focus-events'
" }}}

" }}}

" Fuzzy Finder {{{
Plug 'Shougo/denite.nvim'
nmap <silent> <leader>bb :Denite buffer<CR>
nmap <silent> <leader>ff :Denite file/rec<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" Auto-Complete {{{
if exists("g:gui_oni")
    " use Oni provided language client
    " which is LSP-method as well
else
    " Non-Async Completes
    " Async Completes
    Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup=1
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    nnoremap <silent> <Leader>mh :call LanguageClient#textDocument_hover()<CR>
    set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    let g:LanguageClient_changeThrottle=v:null
    let g:LanguageClient_serverCommands = {
        \ 'c': ['/usr/bin/clangd-6.0'],
        \ 'cpp': ['/usr/bin/clangd-6.0'],
        \ 'python': ['pyls'],
        \ 'javascript': ['flow-language-server', '--stdio'],
        \ 'javascript.jsx': ['flow-language-server', '--stdio'],
        \ 'json': ['vscode-json-languageserver', '--stdio'],
        \ }
    let g:LanguageClient_autoStart=1
    let g:LanguageClient_autoStop=1
    let g:LanguageClient_hoverPreview="Always"
    " C/C++
    " Plug 'Shougo/deoplete-clangx'
    Plug 'Shougo/neoinclude.vim'
    " Python
    " Plug 'zchee/deoplete-jedi'
    " JavaScript
    " Plug 'wokalski/autocomplete-flow'
    " Emoji
    Plug 'fszymanski/deoplete-emoji'
endif
" }}}

" Safe Session
Plug 'tpope/vim-obsession'

call plug#end()
filetype plugin indent on

" }}}

" Space* Key Bindings {{{

" Files
nnoremap <silent> <Leader>fs :w<CR>
" `<Leader>ft` mapped to `:NERDTreeToggle`

" Searches
nnoremap <silent> <Leader>sc :nohlsearch<CR>

" Windows
nnoremap <silent> <Leader>wl <C-w>l
nnoremap <silent> <Leader>wh <C-w>h
nnoremap <silent> <Leader>wj <C-w>j
nnoremap <silent> <Leader>wk <C-w>k
nnoremap <silent> <Leader>wd :close<CR>
nnoremap <silent> <Leader>wS :split<CR>
nnoremap <silent> <Leader>wV :vsplit<CR>

" Buffers
nnoremap <silent> <Leader>bd :bd<CR>

" Language Specifics
" `<Leader>mh` mapped to function doc

" Toggles
" `<Leader>tr` mapped to rainbow parenthesis
nnoremap <silent> <Leader>tnn :set nu!<CR>
nnoremap <silent> <Leader>tnr :set relativenumber!<CR>

" Misc
nnoremap <Leader>qq :qa<CR>

" }}}


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

set background=dark
colorscheme onedark

set title

" list chars - no more TAB and nbsp issues!
set listchars=tab:»-,trail:·,extends:❯,precedes:❮
set list
" vertical split char
set fillchars+=vert:\│,fold:~,diff:⣿
set lazyredraw
set wrap
set breakindent
set showbreak=↪

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

set foldmethod=marker   " code folding: deal with loooooong code blocks
set foldnestmax=2       " too many numbers on left would be a bother
set foldlevel=5         " show all code on start-up
set foldcolumn=5        " show fold open/close: enough for me, I only use one
set foldlevelstart=0

set hidden

" Status Bar
if exists("g:gui_oni")
    set noruler
    set laststatus=0
    set showtabline=0
else                    " in terminal vim
    set ruler           " cursor pos
    set noshowmode      " already have vim-airline
    set showcmd         " show command
    set laststatus=2
    set showtabline=2
endif

" Movement
set scrolloff=5     " lines under / above cursor-line
set mouse=a

" Split Windows
set splitbelow
set splitright

" Editing
" Indentation
set smartindent
set autoindent

" Indentations
set tabstop=8
set softtabstop=4 expandtab
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

if has('nvim')
    set inccommand=nosplit
endif

" Auto-Complete
set path+=**
set ignorecase  " default ignore case when completing
set smartcase   " will stop if you type an uppercase
set wildmode=list:longest,full
set completeopt=menu,menuone,longest,noselect,preview
set previewheight=5     " preview-window to display args for completed functons


" Copy / Paste
" set clipboard=unnamed
" vnoremap y "+y

" Misc
" set matchpairs+=<:>


" File
" Netrw tweaks
let g:netrw_banner=0    " disable help banner
let g:netrw_winsize=25
" let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

" Saving / Backup
set autowrite   " write when switching buffer
set confirm     " confirm before :q etc.


" NeoVim Terminal-Mode
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
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
    autocmd FileType python setlocal sw=4
    " don't jump to first col when inserting inline comments
    autocmd FileType python inoremap # X<c-h>#
    autocmd BufEnter *.wxml setlocal filetype=xml sw=2 cc=120
    autocmd FileType asm    setlocal sw=8 ts=8
    autocmd BufEnter *.ASM  setlocal filetype=asm
augroup END

