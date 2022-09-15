-- nvim-lspconfig
local lsp = require('lspconfig')
local lsp_configs = require('lspconfig.configs')
local lsp_util = require('lspconfig.util')

-- Set autocompletion
local servers = {}
for _, lsp_server in ipairs(servers) do
  lsp[lsp_server].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- nvimtree
require'nvim-tree'.setup {
	hijack_netrw = false,
	disable_netrw = true,
	open_on_setup = false,
	open_on_tab = true,
	update_cwd = true,
	filters = {
		dotfiles = true
	}
}

-- coq-nvim
vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		snippets = {
			enabled = false
		}
	},
	keymap = {
		jump_to_mark = 'null'
	}
}

-- onedark
require('onedark').setup {
    style = 'cool'
}
require('onedark').load()

-- Lualine configuration
require('lualine').setup {
	options = {
		theme = 'onedark'
	},
	sections = {
		lualine_c = {'buffers'}
	}
}

-- Toggleterm
require("nvim-terminal").setup{
	toggle_keymap = '<C-f>'
}
