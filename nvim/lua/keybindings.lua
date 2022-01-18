-- Key mapping
-- Helper function
local map = function(key)
	-- get the extra options
	local opts = {noremap = true}
	for i, v in pairs(key) do
		if type(i) == 'string' then opts[i] = v end
	end
  
	-- basic support for buffer-scoped keybindings
	local buffer = opts.buffer
	opts.buffer = nil
  
	if buffer then
		vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
	else
		vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
	end
end

-- Window mapping
map {'n', '<Leader>w', ':write<CR>'}
map {'n', '<C-h>', '<C-w>h'}
map {'n', '<C-j>', '<C-w>j'}
map {'n', '<C-k>', '<C-w>k'}
map {'n', '<C-l>', '<C-w>l'}
map {'n', '<C-q>', ':wqa!<CR>'}

-- NERDTree Explorer
map {'n', '<C-b>', ':lua require"tree".toggle()<CR>'}

-- Saving
map {'n', '<C-s>', ':wa!<CR>'}

-- Babar
map {'n', '<Tab>', ':w!<CR>:BufferNext<CR>'}
map {'n', '<S-Tab>', ':w!<CR>:BufferPrevious<CR>'}
map {'n', '<C-w>', ':BufferClose<CR>'}
map {'n', '<C-t>', ':tabnew<CR>:wincmd p<CR>'}

-- Fuzzy File Search
map {'n', '<C-p>', ':Files<CR>'}

-- Competitive programming
map {'n', '<C-r>', ':Test<CR>'}

