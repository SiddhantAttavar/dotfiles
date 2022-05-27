-- Neovim specific plugins
if vim.fn.has('win32') == 1 then
	vim.call('plug#begin', '~/AppData/Local/nvim/plugged')
else
	vim.call('plug#begin', '~/.config/nvim/plugged')
end

local Plug = vim.fn['plug#']
-- Plug 'foo/bar'
-- Onedark theme
Plug 'navarasu/onedark.nvim'

-- Fuzzy file search
Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})
Plug 'junegunn/fzf.vim'

-- Git extension
Plug 'tpope/vim-fugitive'

-- Autocomplete
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

-- Tabs, status bar and explorer
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

-- Competitive programming
--Plug 'searleser97/cpbooster.vim'

vim.call('plug#end')
