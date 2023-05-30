return {
	-- Notifications
	{
		'rcarriga/nvim-notify',
		lazy = false,
		config = function()
			vim.notify = require('notify')
		end
	}
}
