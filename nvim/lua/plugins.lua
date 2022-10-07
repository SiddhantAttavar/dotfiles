-- Neovim specific plugins
if vim.loop.os_uname().sysname == 'Windows_NT' then
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

-- Terminal
Plug 's1n7ax/nvim-terminal'

-- Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

-- Startup page, tabs, status bar, terminal and explorer
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'

-- Browser nvim extension
Plug('glacambre/firenvim', {['do'] = vim.fn['firenvim#install(0)']})

-- LSP, autocomplete, and treesitter
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

-- Text editing plugins
Plug 'windwp/nvim-autopairs'

-- Competitive programming
--Plug 'searleser97/cpbooster.vim'

vim.call('plug#end')
