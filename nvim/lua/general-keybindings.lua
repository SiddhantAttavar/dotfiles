-- General key mapping
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

-- Copy-pasting
map {'Y', ':%y+<CR>'}
