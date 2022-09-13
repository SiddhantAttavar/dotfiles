-- Plugin customization files
require('nvim-lspconfig')
require('nvimtree')
require('barbar')
require('tree')
require('lspconfig')
require('coq-nvim')

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
