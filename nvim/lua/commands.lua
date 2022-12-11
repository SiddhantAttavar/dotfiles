-- Commands for neovim
vim.api.nvim_create_user_command(
	'Gcap',
	'Git add . | Git commit -m <args> | Git push',
	{nargs = 1, bang = true, desc = 'Stage commit and push all files in current working folder'}
)
