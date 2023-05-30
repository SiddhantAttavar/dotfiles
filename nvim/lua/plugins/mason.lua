return {
	-- Mason
	{
		'williamboman/mason.nvim',
		dependencies = { 'williamboman/mason-lspconfig.nvim' },
		build = ':MasonUpdate',
		cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
		ft = require('plugins.ft-groups').lsp_fts,
		config = function()
			require('mason').setup {}

			-- setup LSPs
			require('mason-lspconfig').setup {
				ensure_installed = {
					'pylsp',
					'clangd',
					'prosemd_lsp',
					'lua_ls'
				}
			}
		end
	}
}
