return {
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		ft = require('plugins.ft-groups').treesitter_fts,
		dependencies = { 'HiPhish/nvim-ts-rainbow2' },
		config = function()
			-- nvim-treesitter
			require('nvim-treesitter.configs').setup {
				ensure_installed = treesitter_fts,
				highlight = {
					enable = true
				},
				rainbow = {
					enable = true
				}
			}

			require('nvim-treesitter.install').compilers = { 'gcc' }
		end
	}
}
