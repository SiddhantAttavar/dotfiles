" Import settings, plugins, themes etc from different files
" source ~/.config/nvim/settings/file.vim

" Use Vim settings, not Vi settings
set nocompatible

" General customization
source ~/.config/nvim/settings/general-settings.vim
if exists('g:vscode')
	" VSCode-neovim specific customization
	source ~/.config/nvim/settings/vscode-neovim-settings.vim
	source ~/.config/nvim/settings/vscode-neovim-plugins.vim
else
	" Neovim specific customization
	source ~/.config/nvim/settings/neovim-settings.vim
	source ~/.config/nvim/settings/neovim-plugins.vim
	source ~/.config/nvim/settings/themes.vim
	source ~/.config/nvim/settings/keybindings.vim
endif

" Plugin specific customization
if exists('g:vscode')
	" VSCode-neovim specific plugins
else
	" Neovim specific plugins
	source ~/.config/nvim/settings/nerdtree.vim
	source ~/.config/nvim/settings/barbar.vim
	source ~/.config/nvim/settings/vim-airline.vim
endif
