" Leader
let mapleader = " "
" remove space from normal mode, since its the leader key
nnoremap <Space> <NOP>

""" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'VundleVim/Vundle.vim'
    Plug 'junegunn/goyo.vim'

    "" Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Git related
    Plug 'itchyny/vim-gitbranch'
    Plug 'tpope/vim-fugitive'

    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'

    " COC Use release branch (Recommend)
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}

    "Plug 'vhdirk/vim-cmake'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " Paperclip theme for lightmode
    Plug 'NLKNguyen/papercolor-theme'

    " Golang development
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'

call plug#end()

""" Basics
syntax on

" Change buffer without saving
set hidden

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Encoding
set encoding=UTF-8
set showcmd

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

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

" ruler
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

""" Bindings
" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

""" Nerd Tree
"open with ctrl+c
map <C-n> :NERDTreeToggle<CR>

""" Buffers
map gn :bn<cr>
map gp :bp<cr>
map gk :bd<cr>

""" Golang
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <C-c> :cclose<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" run :GoBuild or :GoTestCompile based on the go file
" This is instead of <leader>b
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

""" Theme
set t_Co=256   " This is may or may not needed.
"set background=light
set background=dark
colorscheme PaperColor
map ml :set background=light<cr>
map md :set background=dark<cr>

""" Airline
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1

"""" Vim gutter
"let g:gitgutter_max_signs = 200  " default value
"nmap ]h <Plug>(GitGutterNextHunk)
"nmap [h <Plug>(GitGutterPrevHunk)
"" Customised symbols
"let g:gitgutter_sign_added = '+'
"let g:gitgutter_sign_modified = '~'
"let g:gitgutter_sign_removed = '-'
"" Track added, modified and removed lines
"function! GitStatus()
"  let [a,m,r] = GitGutterGetHunkSummary()
"  return printf('+%d ~%d -%d', a, m, r)
"endfunction
"set statusline+=%{GitStatus()}

"" Filtype
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 noexpandtab

""" Tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()


" " This function will set Vim's background to "light" or "dark"
" depending on if the current color scheme Alacritty is using
" has those keywords in its name.
function! AlignBackground()
  let &background = ( system('alacritty-theme current') =~ "light" ? "light" : "dark" )
  hi Normal guibg=NONE ctermbg=NONE
endfunc

" This function will toggle Alacritty's color scheme back and
" forth between light and super_dark themes. You can find them
" in their entirety in `test/alacritty.yml` in this repository.
function! ToggleAlacrittyTheme()
  if (system('alacritty-theme current') =~ "light")
    call system('alacritty-theme change gruvbox_super_dark')
  else
    call system('alacritty-theme change gruvbox_light')
  endif
  call AlignBackground()
endfunc

nmap <leader>l :call ToggleAlacrittyTheme()<cr>

call AlignBackground()
