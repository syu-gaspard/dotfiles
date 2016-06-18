"dein
let s:dein_dir = finddir('dein.vim', '.;')

if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
    if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
        let s:dein_dir = expand('~/.vim/dein/repos/github.com/Shougo/dein.vim')
        if !isdirectory(s:dein_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif
    endif
    execute ' set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#add('Shougo/dein.vim')
    call dein#add('Shougo/vimproc')
    call dein#add('Shougo/unite.vim')
    call dein#add('h1mesuke/unite-outline')
    call dein#add('Shougo/neomru.vim')
    "call dein#add('fatih/vim-go')
    call dein#add('google/vim-ft-go')
    call dein#add('vim-jp/vim-go-extra')
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

syntax on

set nocompatible

set vb t_vb=

" disable start message
set shortmess+=I

" disable auto comment insert
autocmd FileType * setlocal formatoptions-=ro

"set modeline
"set modelines=5

set hidden
set wildmenu
set cursorline

set ignorecase
set smartcase
set incsearch
set hlsearch

set showmode

set notitle

set ruler
set number

set showmatch

set autoindent
set smartindent

set backspace=indent,eol,start

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

colorscheme jellybeans

"key map
imap <C-j> <C-c>
map <ESC><ESC> :nohl<CR>

"Unite
let g:unite_enable_start_insert=1
nnoremap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nnoremap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <C-u><C-k> :<C-u>Unite bookmark<CR>
nnoremap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>

"go
"vim-go-extra
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufWritePre *.go Fmt
autocmd BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu,preview
autocmd FileType go compiler go
set completeopt=menu,preview
