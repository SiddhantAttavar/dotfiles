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

-- Git
Plug 'tpope/vim-fugitive'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

-- Startup page, tabs, status bar, terminal and explorer
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

-- LSP and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug('ms-jpq/coq_nvim', {['run'] = 'python3 -m coq deps'})
Plug 'ms-jpq/coq.artifacts'
Plug 'ms-jpq/coq.thirdparty'

-- Competitive programming
--Plug 'searleser97/cpbooster.vim'

vim.call('plug#end')
