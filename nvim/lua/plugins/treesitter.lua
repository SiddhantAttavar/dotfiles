return {
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		lazy = false,
		config = function()
			-- nvim-treesitter
			require('nvim-treesitter.configs').setup {
				ensure_installed = require('ft-groups').treesitter_fts,
				highlight = {
					enable = true,
					disable = {
						'help'
					}
				},
				indent = {
					enable = true
				}
			}

			require('nvim-treesitter.install').compilers = { 'gcc' }
		end
	}
}
