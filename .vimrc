" Leader
  let mapleader = " "
  " remove space from normal mode, since its the leader key
  nnoremap <Space> <NOP>

" helps load plugins correctly
  set nocompatible
  filetype off " turned on after plugins

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'junegunn/goyo.vim'
  Plugin 'PotatoesMaster/i3-vim-syntax'
  Plugin 'mlr-msft/vim-loves-dafny', {'for': 'dafny'}
  Plugin 'itchyny/lightline.vim'
  Plugin 'itchyny/vim-gitbranch'
  Plugin 'chrisbra/Colorizer'
  Plugin 'scrooloose/nerdtree'
  Plugin 'ryanoasis/vim-devicons'
call vundle#end()

" basics
  filetype plugin indent on
  syntax on
  set nocompatible
  " Security
  set modelines=0
  " Show line numbers
  set number
  " Encoding
  set encoding=utf-8
  " Whitespace
  "set wrap
  "set textwidth=74
  set formatoptions=tcqrn1
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set noshiftround
  set showcmd
  set autoindent
  " Automatically deletes all trailing whitespace on save.
	  autocmd BufWritePre * %s/\s\+$//e

" Searching
  set nohlsearch
  set incsearch
  set ignorecase
  set smartcase
  set showmatch

" Nerd tree
  map <leader>n :NERDTreeToggle<CR>

  " open automatically if no arguments has been given
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  " automatic close when opening a file
  let NERDTreeQuitOnOpen = 1

  " Prettify
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1

  " automatically delete the buffer of the file you just deleted
  let NERDTreeAutoDeleteBuffer = 1

  " close if its the only window open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" bindings
  " Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>
  " switch between relative and actual line numbers
  map <leader>z :let [&nu, &rnu] = [&rnu==0, &nu]<CR>

  " newline without insertmode
  nmap <leader>o o<Esc>
  nmap <leader>O O<Esc>

  " yank and paste with clipboard
  map <leader>y "+y
  map <leader>p "+p
  map <leader>Y "+Y
  map <leader>P "+P

  " using chrisbra/Colorizer plugin
  map <leader>c :ColorHighlight<CR>

" Status line
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
