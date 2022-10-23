vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- use 'foo/bar'
	-- packer.nvim
	use 'wbthomason/packer.nvim'

	-- Onedark theme
	use 'navarasu/onedark.nvim'

	-- Fuzzy finder / Telescope
	use { 'junegunn/fzf', run = ':call fzf#install()' }
	use 'junegunn/fzf.vim'
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',requires = { 'nvim-lua/plenary.nvim' } }

	-- Git
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'

	-- Icons
	use 'kyazdani42/nvim-web-devicons'
	use 'ryanoasis/vim-devicons'

	-- UI: Startup page, tabs, status bar, explorer etc.
	use { 'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
	use 'kyazdani42/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'
	use { 'akinsho/toggleterm.nvim', tag = '*' }
	use 'rcarriga/nvim-notify'
	use 'lukas-reineke/indent-blankline.nvim'

	-- Projects
	use 'ahmedkhalf/project.nvim'

	-- Browser nvim extension
	use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

	-- LSP and autocomplete
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- Treesitter and syntax highlighting
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	-- DAP
	use 'mfussenegger/nvim-dap'

	-- Text editing plugins
	use 'windwp/nvim-autopairs'
	use 'numToStr/Comment.nvim'

	-- Competitive programming
	use { 'xeluxee/competitest.nvim', requires = {'MunifTanjim/nui.nvim'} }

	-- Markdown
	-- install without yarn or npm
	use { 'iamcco/markdown-preview.nvim', run = function() vim.fn['mkdp#util#install']() end }
end)
