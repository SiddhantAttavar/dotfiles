-- Key bindings for neovim
-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Copy-pasting
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'Y', ':%y+<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', opts)
vim.api.nvim_set_keymap('n', ';', ':', opts)
vim.api.nvim_set_keymap('i', '<C-BS>', '<C-W>', opts)
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', opts)

-- Highlighting
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR><esc>', opts)

if not (vim.g.vscode) then
	-- Window mapping
	vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', opts)
	vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', opts)
	vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', opts)
	vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', opts)
	vim.api.nvim_set_keymap('n', '<C-q>', ':wa<CR>:xa<CR>', opts)

	-- Saving
	vim.api.nvim_set_keymap('n', '<C-s>', ':wa<CR>', opts)

	-- Buffers
	vim.api.nvim_set_keymap('n', 'J', ':bn<CR>', opts)
	vim.api.nvim_set_keymap('n', 'K', ':bp<CR>', opts)
	vim.api.nvim_set_keymap('n', '<C-w>', ':bd %<CR>', opts)
	vim.api.nvim_set_keymap('n', '<C-t>', ':enew<CR>', opts)

	-- Create empty line
	vim.api.nvim_set_keymap('n', '`', 'o<esc>k', opts)
	vim.api.nvim_set_keymap('n', '~', 'O<esc>j', opts)

	-- Competitive-Programming
	vim.api.nvim_set_keymap('n', '<Leader>ux', ':!cp ~/d/Competitions/Competitive-Programming/Templates/Template.cpp "%"<CR>l<CR>', opts)
end
