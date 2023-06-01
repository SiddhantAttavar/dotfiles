return {
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = { 'HiPhish/nvim-ts-rainbow2' },
		ft = require('ft-groups').treesitter_fts,
		cmd = { 'TSUpdate' },
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
