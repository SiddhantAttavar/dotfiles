-- Babar configuration
vim.g.bufferline = {
	animation = true,
	auto_hide = true,
	closable = true,
	clickable = true,
	tabpages = true,
	exclude_name = {'/bin/bash'}
}

vim.cmd "augroup rc" 
vim.cmd "au!"
vim.cmd "au TermOpen * setlocal nobuflisted"
vim.cmd "augroup END"
