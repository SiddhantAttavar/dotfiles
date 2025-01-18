" Neovim specific plugins
" Plug 'foo/bar'
" Install vim-plug if not found

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" Onedark theme
Plug 'joshdick/onedark.vim'

" Fuzzy file search
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'

" Git extension
Plug 'tpope/vim-fugitive'

" Autocomplete

" Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Tabs, status bar and explorer
Plug 'romgrk/barbar.nvim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Competitive programming
" Plug 'searleser97/cpbooster.vim'

call plug#end()
