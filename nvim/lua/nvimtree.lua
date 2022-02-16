-- NvimTree customization
require'nvim-tree'.setup {
	hijack_netrw = false,
    auto_close = true,
	open_on_setup = false,
    open_on_tab = false,
	update_cwd = true,
	view = {
		auto_resize = true
	}
}

-- Set offset for barbar is it is started with a directory argument
vim.cmd "autocmd StdinReadPre * let s:std_in=1"
vim.cmd "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NvimTreeOpen' | execute 'lua require\"bufferline.state\".set_offset(31)' | execute 'cd '.argv()[0] | endif"
--vim.cmd "autocmd VimEnter * if argc() == 0 | tabnew | endif"
