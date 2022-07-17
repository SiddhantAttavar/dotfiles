-- Plugin customization files
require('nvimtree')
require('barbar')
require('tree')

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
