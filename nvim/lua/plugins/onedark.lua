return {
	-- Onedark theme
	{
		'navarasu/onedark.nvim',
		lazy = false,
		config = function()
			require('onedark').setup {
				style = 'cool'
			}
			require('onedark').load()
		end
	}
}
