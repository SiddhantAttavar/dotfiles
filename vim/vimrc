" Import settings, plugins, themes etc from different files
" source ./settings/file.vim

" General customization
runtime ./settings/general-settings.vim
if exists('g:vscode')
	" VSCode-neovim specific customization
	runtime ./settings/vscode-neovim-settings.vim
	runtime ./settings/vscode-neovim-plugins.vim
else
	" Neovim specific customization
	runtime ./settings/neovim-settings.vim
	runtime ./settings/neovim-plugins.vim
	runtime ./settings/themes.vim
	runtime ./settings/keybindings.vim
endif

" Plugin specific customization
if exists('g:vscode')
	" VSCode-neovim specific plugins
else
	" Neovim specific plugins
	runtime ./settings/nerdtree.vim
	runtime ./settings/barbar.vim
	runtime ./settings/vim-airline.vim
endif
