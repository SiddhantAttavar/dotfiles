-- Key bindings for neovim
-- Window mapping
vim.api.nvim_set_keymap('n', '<Leader>w', ':write<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', ':wa<CR>ZZ', { noremap = true })

-- NERDTree Explorer
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true })

-- Saving
vim.api.nvim_set_keymap('n', '<C-s>', ':wa<CR>', { noremap = true })

-- Babar
vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-t>', ':enew<CR>', { noremap = true })

-- Fuzzy File Search
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true })

-- Terminal
vim.api.nvim_set_keymap('t', '<C-f>', '<C-\\><C-n>:lua NTGlobal["terminal"]:toggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', { noremap = true })
