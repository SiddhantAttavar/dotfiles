return {
	-- Guess indent
	{
		'nmac427/guess-indent.nvim',
		lazy = false,
		config = function()
			require('guess-indent').setup {
				filetype_exclude = {
					'netrw',
					'tutor',
					'markdown',
					'txt',
				}
			}
		end
	}
}
