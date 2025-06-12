local server_config = {
	pylsp = {
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						enabled = false
					}
				}
			}
		}
	},
	clangd = {},
	prosemd_lsp = {},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = 'LuaJIT',
				},
				diagnostics = {
					globals = { 'vim' }
				},
				telemetry = {
					enable = false
				}
			}
		}
	},
	nextflow_ls = {
		cmd = { 'java', '-jar', '/home/sidat/.local/bin/nextflow-language-server-all.jar' },
		filetypes = { 'nextflow' },
		root_markers = { 'nextflow.config', '.git' },
		settings = {
			nextflow = {
				files = {
					exclude = { '.git', '.nf-test', 'work' },
				},
			},
		}
	}
}

return {
	-- Mason
	{
		'williamboman/mason.nvim',
		dependencies = { 'williamboman/mason-lspconfig.nvim' },
		build = ':MasonUpdate',
		cmd = { 'Mason', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
		ft = require('ft-groups').lsp_fts,
		config = function()
			require('mason').setup {}

			local lsp_list = {}
			if not vim.fn.exists('$TERMUX') then
				for lsp, _ in pairs(server_config) do
					table.insert(lsp_list, lsp)
				end
			end

			-- setup LSPs
			require('mason-lspconfig').setup {
				ensure_installed = lsp_list
			}
		end
	},

	-- LSP config
	{
		'neovim/nvim-lspconfig',
		dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'hrsh7th/cmp-nvim-lsp', 'ray-x/lsp_signature.nvim' },
		lazy = false,
		config = function()
			local lspconfig = require('lspconfig')

			-- Diagnostic display options
			local signs = { Error = '✘', Warn = '▲', Hint = '⚑', Info = '»' }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Customize defaults
			local lsp_default_config = lspconfig.util.default_config
			lsp_default_config.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_default_config.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			lsp_default_config.on_attach = function(client, bufnr)
				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
				vim.keymap.set('n', '<C-S-k>', vim.lsp.buf.hover, bufopts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
				vim.keymap.set('n', '<Leader>wk', vim.lsp.buf.signature_help, bufopts)
				vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
				vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
				vim.keymap.set('n', '<Leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
					bufopts)
				vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
				vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
				vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
				vim.keymap.set('n', '<Leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts)
			end

			-- Setup lsp servers
			for server_name, config in pairs(server_config) do
				lspconfig[server_name].setup(config)
			end

			-- lsp_signature setup
			require('lsp_signature').setup {}
		end
	}
}
