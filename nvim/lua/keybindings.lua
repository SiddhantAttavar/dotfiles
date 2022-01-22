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
		vim.api.nvim_buf_set_keymap('n', 0, key[1], key[2], opts)
	else
		vim.api.nvim_set_keymap('n', key[1], key[2], opts)
	end
end

-- Window mapping
map {'<Leader>w', ':write<CR>'}
map {'<C-h>', '<C-w>h'}
map {'<C-S-h>', '<C-w>H'}
map {'<C-j>', '<C-w>j'}
map {'<C-k>', '<C-w>k'}
map {'<C-l>', '<C-w>l'}
map {'<C-q>', ':wqa<CR>'}

-- NERDTree Explorer
map {'<C-b>', ':lua require"tree".toggle()<CR>'}

-- Saving
map {'<C-s>', ':wa<CR>'}

-- Copy-pasting
map {'<C-S-c>', ':%y+'}

-- Babar
map {'<Tab>', ':BufferNext<CR>'}
map {'<S-Tab>', ':BufferPrevious<CR>'}
map {'<C-w>', ':BufferClose<CR>'}
map {'<C-t>', ':tabnew<CR>:wincmd p<CR>'}

-- Fuzzy File Search
map {'<C-p>', ':Files<CR>'}

-- Competitive programming
map {'<C-r>', ':Test<CR>'}

