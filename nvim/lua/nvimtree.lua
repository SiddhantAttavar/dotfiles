-- NvimTree customization
require'nvim-tree'.setup {
	hijack_netrw = false,
	disable_netrw = true,
	open_on_setup = false,
	open_on_tab = true,
	update_cwd = true,
	filters = {
		dotfiles = true
	}
}

vim.opt.splitright = true

-- Set offset for barbar is it is started with a directory argument
vim.cmd "autocmd StdinReadPre * let s:std_in=1"
vim.cmd "autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'lua require\"bufferline.state\".set_offset(31)' | endif"
vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

