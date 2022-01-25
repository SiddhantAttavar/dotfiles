-- NvimTree customization
require'nvim-tree'.setup {
    auto_close = true,
    open_on_tab = true,
	update_cwd = true,
	view = {
		auto_resize = true
	},
	filters = {
		dotfiles = true
	}
}
