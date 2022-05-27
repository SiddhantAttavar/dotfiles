-- Import settings, plugins, themes etc from different files
-- require('file')

-- General customization
require('general-settings')
require('general-keybindings')
if vim.g.vscode then
	-- VSCode-neovim specific customization
	require('vscode-neovim-settings')
	require('vscode-neovim-plugins')
else
	-- Neovim specific customization
	require('neovim-settings')
	require('neovim-plugins')
	require('themes')
	require('neovim-keybindings')
end

-- Plugin specific customization
if vim.g.vscode then
	-- VSCode-neovim specific plugins
else
	-- Neovim specific plugins
	require('neovim-plugin-setup')
	require('nvimtree')
	require('barbar')
	require('nvimlualine')
	require('tree')
	require('nvim-lspconfig')
	require('nvim-cmp')
end
