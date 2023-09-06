-- Commands for neovim
vim.api.nvim_create_user_command(
	'Gcap',
	'Git pull | Git add . | Git commit -m <args> | Git push',
	{
		nargs = 1,
		bang = true,
		desc = 'Stage, commit and push all files in current working folder'
	}
)

vim.api.nvim_create_user_command(
	'Gca',
	'Git add . | Git commit -m <args>',
	{
		nargs = 1,
		bang = true,
		desc = 'Stage and commit all files in current working folder'
	}
)
