return {
	-- Dashboard
	{
		'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		cond = function()
			return vim.fn.argc() == 0
		end,
		lazy = false,
		config = function()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')

			-- Set header
			dashboard.section.header.val = {
				'                                                     ',
				'  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
				'  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
				'  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
				'  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
				'  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
				'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝	  ╚═╝ ',
				'                                                     ',
			}

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button('e', '	> New file', ':ene <BAR> startinsert <CR>'),
				dashboard.button('f', '	> Find file', ':Files<CR>'),
				dashboard.button('r', '	> Recent', ':History<CR>'),
				dashboard.button('s', '	> Settings', ':e $MYVIMRC<CR>'),
				dashboard.button('q', '	> Quit NVIM', ':qa<CR>'),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end
	}
}