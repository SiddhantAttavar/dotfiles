-- Always on plugins
local always_on = {
	'tpope/vim-sensible',
	'tpope/vim-obsession',
	'tpope/vim-surround',
	'tpope/vim-eunuch',
	'nvim-lua/plenary.nvim',
}

-- Just require('plugin').setup()
local just_setup = {
	['windwp/nvim-autopairs'] = 'nvim-autopairs',
	['lukas-reineke/indent-blankline.nvim'] = 'indent_blankline',
	['lewis6991/gitsigns.nvim'] = 'gitsigns',
	['numToStr/Comment.nvim'] = 'Comment',
	['folke/which-key.nvim'] = 'which-key',
}

-- Plugins with just one line of config
local text_fts = require('plugins.ft-groups').treesitter_fts
local plugins = {
	{ 'tpope/vim-tbone', cmd = { 'Tmux', 'Tyank', 'Tput', 'Twrite', 'Tattach' } },
	{ 'tpope/vim-fugitive', cmd = { 'Git', 'G' } },
	{ 'kyazdani42/nvim-web-devicons', lazy = false },
	{ 'tpope/vim-abolish', ft = text_fts },
	{ 'tpope/vim-endwise', ft = text_fts },
}


-- Add plugins into a single table
for _, plugin in ipairs(always_on) do
	table.insert(plugins, {
		plugin,
		lazy = false
	})
end

for plugin, name in pairs(just_setup) do
	table.insert(plugins, {
		plugin,
		lazy = false,
		config = function()
			require(name).setup()
		end
	})
end

return plugins
