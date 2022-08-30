-- Plugin customization files
require('nvim-lspconfig')
require('nvimtree')
require('barbar')
require('tree')
require('lspconfig')

-- Onedark
require('onedark').setup {
    style = 'cool'
}
require('onedark').load()

-- Lualine configuration
require('lualine').setup {
	options = {
		theme = 'onedark'
	}
}

-- coq-nvim setup
vim.g.coq_settings = {
	auto_start = 'shut-up',
	clients = {
		snippets = {
			enabled = false
		}
	}
}

