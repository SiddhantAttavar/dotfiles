-- Offset the tabs for filetree
local tree = {}
tree.toggle = function()
	require'nvim-tree'.toggle()
	if require'nvim-tree.view'.win_open() then
		require'bufferline.state'.set_offset(31)
		require'nvim-tree'.find_file(true)
	else
		require'bufferline.state'.set_offset(0)
		require'nvim-tree'.close()
	end
end

return tree
