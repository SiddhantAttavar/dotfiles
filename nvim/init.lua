-- Import settings, plugins, themes etc from different files
-- require('file')

-- General customization
require('settings')
require('keybindings')
if not (vim.g.vscode) then
	-- Neovim specific customization
	require('plugins')
	require('themes')
	require('nvim-keybindings')
end

-- Plugin specific customization
if not (vim.g.vscode) then
	-- Neovim specific plugins
	require('plugin-setup')
	require('nvimtree')
	require('barbar')
	require('nvimlualine')
	require('tree')
end
