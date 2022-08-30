-- Import settings, plugins, themes etc from different files
-- require('file')

-- General customization
require('settings')
require('keybindings')

if not (vim.g.vscode) then
	-- Neovim specific customization
	require('plugins')
	require('plugin-setup')
	require('nvim-keybindings')
end
