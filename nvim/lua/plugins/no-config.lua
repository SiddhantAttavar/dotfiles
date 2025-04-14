-- Always on plugins
local always_on = {
	'tpope/vim-sensible',
	'tpope/vim-obsession',
	'tpope/vim-surround',
	'tpope/vim-eunuch',
	'nvim-lua/plenary.nvim',
	'michaeljsmith/vim-indent-object',
}

-- Plugins with just one line of config
local text_fts = require('ft-groups').treesitter_fts
local plugins = {
	{ 'tpope/vim-tbone', cmd = { 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' } },
	{ 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },
	{ 'tpope/vim-abolish', ft = text_fts },
	{ 'kyazdani42/nvim-web-devicons', lazy = false },
	{ 'windwp/nvim-autopairs', lazy = false, config = true },
	{ 'lukas-reineke/indent-blankline.nvim', main = 'ibl', lazy = false, config = true },
	{ 'lewis6991/gitsigns.nvim', lazy = false, config = true },
	{ 'numToStr/Comment.nvim', lazy = false, config = true },
	{ 'folke/which-key.nvim', lazy = false, config = true },
}


-- Add plugins into a single table
for _, plugin in ipairs(always_on) do
	table.insert(plugins, {
		plugin,
		lazy = false
	})
end

return plugins
