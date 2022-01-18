-- Import settings, plugins, themes etc from different files
-- require('file')

-- General customization
require('general-settings')
if vim.g.vscode then
	-- VSCode-neovim specific customization
	require('vscode-neovim-settings')
	require('vscode-neovim-plugins')
else
	-- Neovim specific customization
	require('neovim-settings')
	require('neovim-plugins')
	require('themes')
	require('keybindings')
end

-- Plugin specific customization
if vim.g.vscode then
	-- VSCode-neovim specific plugins
else
	-- Neovim specific plugins
	require('nvimtree')
	require('barbar')
	require('nvimlualine')
	require('tree')
end
