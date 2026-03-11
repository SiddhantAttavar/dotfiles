-- Key bindings for neovim
-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Copy-pasting
local opts = { noremap = true, silent = true }
vim.keymap.set('n', 'Y', '<CMD>%y+<CR>', opts)
vim.keymap.set('n', '<C-v>', '"+p', opts)
vim.keymap.set('n', ';', '<CMD>', opts)
vim.keymap.set('i', '<C-BS>', '<C-W>', opts)
vim.keymap.set('i', '<C-H>', '<C-W>', opts)

-- Window mapping
vim.keymap.set('n', '<Leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<Leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<Leader>k', '<C-w>k', opts)
vim.keymap.set('n', '<Leader>l', '<C-w>l', opts)
vim.keymap.set('n', '<C-q>', '<CMD>wa<CR>:qa<CR>', opts)

-- Saving
vim.keymap.set('n', '<C-s>', '<CMD>wa<CR>', opts)
vim.keymap.set('n', 'qq', '<Nop>', opts)
vim.keymap.set('n', 'qq', '<CMD>wa<CR>', opts)
vim.keymap.set('n', 'Q', '<CMD>wa<CR>', opts)

-- Buffers
vim.keymap.set('n', 'J', '<CMD>bn<CR>', opts)
vim.keymap.set('n', 'K', '<CMD>bp<CR>', opts)
vim.keymap.set('n', '<C-w>', '<CMD>bd %<CR>', opts)
vim.keymap.set('n', '<C-t>', '<CMD>enew<CR>', opts)

-- Create empty line
vim.keymap.set('n', '`', 'o<esc>k', opts)
vim.keymap.set('n', '~', 'O<esc>j', opts)

-- Highlighting
vim.keymap.set('n', '<esc>', '<CMD>noh<CR><esc>', opts)

-- Terminal
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', opts)

-- Competitive-Programming
vim.keymap.set('n', '<Leader>ux', '<CMD>!cp ~/competitions/Competitive-Programming/Templates/Template.cpp "%"<CR>l<CR>', opts)
