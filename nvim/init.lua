-- Import settings, plugins, themes etc from different files
-- require('file')

-- General customization
require('settings')
if not vim.g.vscode then
	-- Neovim specific customization
	require('plugins-load')
	require('keybindings')
	require('commands')
end
