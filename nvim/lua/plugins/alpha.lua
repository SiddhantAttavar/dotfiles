return {
	-- Dashboard
	{
		'goolord/alpha-nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', 'natecraddock/workspaces.nvim' },
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
				dashboard.button('l', '󰙰	> Load workspace', ':lua require("workspaces").fzf_open_workspaces()<CR>'),
				dashboard.button('i', '	> New file', ':ene <BAR> startinsert <CR>'),
				dashboard.button('f', '󰈞	> Find file', ':Files<CR>'),
				dashboard.button('r', '	> Recent', ':History<CR>'),
				dashboard.button('s', '	> Settings', ':e $MYVIMRC<CR>'),
				dashboard.button('q', '󰿅	> Quit NVIM', ':qa<CR>'),
			}

			-- Send config to alpha
			alpha.setup(dashboard.opts)
		end
	}
}
