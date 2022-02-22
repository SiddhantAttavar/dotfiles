-- Offset the tabs for filetree
local tree = {}
tree.toggle = function()
	require'nvim-tree'.toggle()
	if require'nvim-tree.view'.is_visible() then
		require'bufferline.state'.set_offset(31)
		require'nvim-tree'.find_file(true)
		vim.cmd("wincmd p")
	else
		require'bufferline.state'.set_offset(0)
	end
end

return tree
