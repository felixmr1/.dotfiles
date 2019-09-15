" Leader
let mapleader = " "
" remove space from normal mode, since its the leader key
nnoremap <Space> <NOP>

" helps load plugins correctly
set nocompatible
    filetype off " turned on after plugins


""" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
      Plugin 'VundleVim/Vundle.vim'
      Plugin 'junegunn/goyo.vim'
      Plugin 'PotatoesMaster/i3-vim-syntax'
      Plugin 'itchyny/lightline.vim'
      Plugin 'itchyny/vim-gitbranch'
      Plugin 'Valloric/YouCompleteMe'
      let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
      Plugin 'morhetz/gruvbox'
      Plugin 'scrooloose/nerdtree'
      Plugin 'ryanoasis/vim-devicons'
call vundle#end()


""" Basics
filetype plugin indent on
syntax on
set nocompatible
" set modifiable
set ma
" Security
set modelines=0
" Show line numbers
set relativenumber
" Encoding
set encoding=UTF-8
"set wrap
"set textwidth=74
set showcmd
set autoindent
" open new terminal below current
set splitbelow
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e
highlight Visual cterm=bold ctermbg=green ctermfg=NONE

" intendation
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


""" Searching
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch


""" Bindings
" Open new terminal
map <leader>t :term<CR>

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>
" switch between relative and actual line numbers
map <leader>z :let [&nu, &rnu] = [&rnu==0, &nu]<CR>

" yank and paste with clipboard vim must be compiled with clipboard enabled
map <leader>y "+y
map <leader>p "+p

""" Status line
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }


""" Color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode

" Change vim visual mode highlight color
hi Visual cterm=bold ctermbg=Blue ctermfg=NONE


""" NerdTree
" open nerd tree when no files are specified '$ vim'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


