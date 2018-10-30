set nocompatible
set nowritebackup nobackup
set autowrite confirm
set modelines=0
filetype plugin indent on

let mapleader="\ "

set path+=**
set ignorecase smartcase
set wildmode=list:longest,full
set completeopt=menu,menuone,longest,noselect,preview
set previewheight=5


" Theme
set background=dark
colorscheme default
let g:netrw_banner=0
let g:netrw_liststyle=3
set ruler
set showcmd
set laststatus=2 showtabline=2
set scrolloff=5
set hlsearch
nohlsearch
set incsearch
nnoremap <BS> :noh<CR><C-w>z

" Window Behaviours
set splitbelow splitright
set hidden


" Clear Mind Editings
set listchars=tab:>-,trail:-
set list

" Line Number
set number relativenumber

" Move Faster
set mouse=a
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" nnoremap <Leader>1 1gt
" nnoremap <Leader>2 2gt
" nnoremap <Leader>3 3gt
" nnoremap <Leader>4 4gt
" nnoremap <Leader>5 5gt
" nnoremap <Leader>6 6gt
" nnoremap <Leader>7 7gt
" nnoremap <Leader>8 8gt
" nnoremap <Leader>9 9gt
nnoremap <Leader>>> :+tabmove<CR>
nnoremap <Leader><< :-tabmove<CR>
nnoremap <Leader>h gT
nnoremap <Leader>l gt

" Space for Tabs
set autoindent smartindent
set expandtab smarttab
" - Pythonic 4-Spaces
set ts=4 sts=0 sw=4

" Editings
set backspace=2
vnoremap > >gv
vnoremap < <gv

" Folding
set foldmethod=manual
set foldnestmax=3
set foldlevel=5
set foldcolumn=5


" Space*** Key-Bindings
nnoremap <Leader>fs :w<CR>
nnoremap <Leader>wV :vsp<CR>
nnoremap <Leader>wS :sp<CR>
nnoremap <Leader>wd :close<CR>
nnoremap <Leader>wh <C-w>h
nnoremap <Leader>wl <C-w>l
nnoremap <Leader>wj <C-w>j
nnoremap <Leader>wk <C-w>k

" `surround.vim` Emulator
vnoremap S) <Esc>`>a)<Esc>`<i(<Esc>
vnoremap S( <Esc>`>a<Space>)<Esc>`<i(<Space><Esc>h
" vnoremap S] <Esc>`>a]<Esc>`<i[<Esc>
" vnoremap S[ <Esc>`>a<Space>]<Esc>`<i[<Space><Esc>h

" `commentary.vim` Emulator
" nnoremap gcc I<Space><Backspace>#<Space><Esc>h
" vnoremap gc <Esc>I<Space><Backspace>#<Space><Esc>h

" Hack Fixes
inoremap # <Space><Backspace>#

