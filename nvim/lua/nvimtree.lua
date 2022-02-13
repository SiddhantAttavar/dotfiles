-- NvimTree customization
require'nvim-tree'.setup {
    auto_close = true,
	open_on_setup = true,
    open_on_tab = true,
	update_cwd = true,
	view = {
		auto_resize = true
	}
}

-- Autostart NvimTree with a directory is opened
vim.cmd "autocmd StdinReadPre * let s:std_in=1"
vim.cmd "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | tabnew | execute 'NvimTreeOpen' | execute 'lua require\"bufferline.state\".set_offset(31)' | execute 'cd '.argv()[0] | endif"
