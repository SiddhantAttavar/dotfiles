-- Key bindings for neovim
-- Copy-pasting
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'Y', ':%y+<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', opts)

-- Highlighting
vim.api.nvim_set_keymap('n', '<esc>', ':noh<CR><esc>', opts)

if not (vim.g.vscode) then
	-- Window mapping
	vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opts)
	vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', opts)
	vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', opts)
	vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', opts)
	vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', opts)
	vim.api.nvim_set_keymap('n', '<C-q>', ':wa<CR>:xa<CR>', opts)

	-- NERDTree Explorer
	vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

	-- Saving
	vim.api.nvim_set_keymap('n', '<C-s>', ':wa<CR>', opts)

	-- Buffers
	vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', opts)
	vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', opts)
	vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', opts)
	vim.api.nvim_set_keymap('n', '<C-t>', ':enew<CR>', opts)

	-- Fuzzy File Search
	vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', opts)

	-- Terminal
	vim.api.nvim_set_keymap('n', '<C-f>', ':ToggleTerm<CR>', opts)
	vim.api.nvim_set_keymap('t', '<C-f>', '<C-\\><C-n>:ToggleTerm<CR>', opts)
	vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', opts)

	-- LSP
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end
