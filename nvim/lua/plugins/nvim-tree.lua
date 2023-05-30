return {
	-- File Tree
	{
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		keys = { { '<C-b>', ':NvimTreeToggle<CR>' } },
		config = function()
			require('nvim-tree').setup {
				hijack_netrw = true,
				disable_netrw = true,
				open_on_tab = true,
				update_cwd = true,
				filters = {
					dotfiles = true
				}
			}
		end
	}
}
