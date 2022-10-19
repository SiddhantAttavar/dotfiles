vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- use 'foo/bar'
	-- packer.nvim
	use 'wbthomason/packer.nvim'

	-- Onedark theme
	use 'navarasu/onedark.nvim'

	-- Fuzzy file search
	use { "junegunn/fzf", run = ':call fzf#install()' }
	use 'junegunn/fzf.vim'

	-- Git
	use 'tpope/vim-fugitive'

	-- Terminal
	use 's1n7ax/nvim-terminal'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'

	-- Startup page, tabs, status bar, terminal and explorer
	use 'kyazdani42/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'

	-- Browser nvim extension
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	-- LSP, autocomplete, and treesitter
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- Text editing plugins
	use 'windwp/nvim-autopairs'

	-- Competitive programming
	--use 'searleser97/cpbooster.vim'
end)
