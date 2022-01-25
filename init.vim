set nocompatible              " required
filetype off                  " required

call plug#begin()

Plug 'tmhedberg/SimpylFold' " Folding Python
Plug 'vim-scripts/indentpython.vim' " Handles continuation lines in brackets and indents if/for/while statements
Plug 'tpope/vim-surround' " Surrounding plugin
Plug 'bling/vim-airline' " Powerline for Vim
Plug 'christoomey/vim-tmux-navigator' " Ease navigation between Vim and Tmux
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parentheses, quotes in pair
Plug 'mattn/emmet-vim' " Improve HTML and CSS workflow
Plug 'ternjs/tern_for_vim' " Tern-based Javascript editing support
Plug 'pangloss/vim-javascript' " Syntax highlighting and indentation for Javascript
Plug 'dense-analysis/ale' " Linting
Plug 'tpope/vim-fugitive' " Git
Plug 'airblade/vim-gitgutter' " Show Git changes
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " Deoplete
Plug 'zchee/deoplete-jedi' " Deoplete-Jedi

call plug#end()

filetype plugin indent on    " required
set smartindent

syntax on

set clipboard=unnamed

set backupcopy=yes

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set textwidth=120
set t_Co=256

autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

au FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})

" Open file explorer with -
nnoremap - :Explore<CR>

" Splits
set splitbelow
set splitright
"saner splits
nnoremap <C-w>\| <C-w><C-v>
nnoremap <C-w>_ <C-w><C-s>
"resizing splits
nnoremap <C-w><C-w>h 8<C-w><
nnoremap <C-w><C-w>l 8<C-w>>
nnoremap <C-w><C-w>k 8<C-w>-
nnoremap <C-w><C-w>j 8<C-w>+
nnoremap <C-w><C-w><C-w>h <C-w><
nnoremap <C-w><C-w><C-w>l <C-w>>
nnoremap <C-w><C-w><C-w>k <C-w>-
nnoremap <C-w><C-w><C-w>j <C-w>+

" Remove highlighting after search
nnoremap <silent> <C-l> :nohl<CR>

" Set numbers
set number
set relativenumber
nnoremap <F2> :set nonumber! norelativenumber!<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
"
" Docstrings for folded code
let g:SimpylFold_docstring_preview=1

let g:indentLine_noConcealCursor=1

" Tmux-Vim navigation
let g:tmux_navigator_no_mappings=1
nnoremap <silent> <C-w><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-w><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-w><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-w><C-l> :TmuxNavigateRight<CR>

" Set Emmet key to ,
let g:user_emmet_leader_key=','

" Ale
let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ 'cpp': ['cc']
            \}
let g:ale_open_list = 1

map <C-e> <Plug>(ale_next_wrap)
map <C-r> <Plug>(ale_previous_wrap)

" Deoplete
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
