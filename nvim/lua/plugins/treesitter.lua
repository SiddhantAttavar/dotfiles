return {
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		ft = require('ft-groups').treesitter_fts,
		cmd = { 'TSUpdate', 'TSInstall', 'TSUninstall', 'TSBufEnable' },
		config = function()
			-- nvim-treesitter
			require('nvim-treesitter.configs').setup {
				ensure_installed = require('ft-groups').treesitter_fts,
				highlight = {
					enable = true
				}
			}

			require('nvim-treesitter.install').compilers = { 'gcc' }
		end
	}
}
