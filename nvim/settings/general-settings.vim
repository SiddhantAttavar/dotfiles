" General settings
" Enable line numbers and word wrapping
set number
set relativenumber
set linebreak

" Indentation settings
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set autoindent
set smartindent

" Copy/paste from system clipboard
set paste
set clipboard=unnamedplus

" Enable the mouse
set mouse=a

" Set default encoding to UTF-8
set encoding=UTF-8

" Make sure vim-plug is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

