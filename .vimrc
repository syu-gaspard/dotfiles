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
    call dein#add('Shougo/unite.vim')
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

syntax on

"set modeline
"set modelines=5

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

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

colorscheme jellybeans

"key map
imap <C-j> <ESC>

"Unite
nnoremap <silent> <C-u>b :<C-u>Unite buffer<CR>
nnoremap <silent> <C-u>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-u>r :<C-u>Unite -buffer-name=register register<CR>
