return {
	-- Guess indent
	{
		'nmac427/guess-indent.nvim',
		lazy = false,
		config = true,
		opts = {
			filetype_exclude = {
				'netrw',
				'tutor',
				'markdown',
				'txt',
			}
		}
	}
}
