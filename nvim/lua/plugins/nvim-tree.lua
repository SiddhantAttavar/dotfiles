return {
	-- File Tree
	{
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeToggle',
		keys = { { '<C-b>', ':NvimTreeToggle<CR>' } },
		config = true,
		opts = {
			hijack_netrw = true,
			disable_netrw = true,
			open_on_tab = true,
			update_cwd = true,
			filters = {
				dotfiles = true
			}
		}
	}
}
